import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
      items: [
        BottomNavigationBarItem(
            // icon: Icon(MdiIcons.windowClosedVariant, size: 20), //! REINSTATE WHEN PACKAGE NULL SAFE
            icon: Icon(Icons.close, size: 20),
            label: 'Blinds'),
        //BottomNavigationBarItem(icon: Icon(MdiIcons.informationOutline, size: 20), label: 'About'), //! REINSTATE WHEN PACKAGE NULL SAFE
        BottomNavigationBarItem(icon: Icon(Icons.close, size: 20), label: 'About'),
        //BottomNavigationBarItem(icon: Icon(MdiIcons.cart, size: 20), label: 'Cart'), //! REINSTATE WHEN PACKAGE NULL SAFE
        BottomNavigationBarItem(icon: Icon(Icons.close, size: 20), label: 'Cart'),
      ].toList(),
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nuttin
            break;
          case 1:
            Navigator.pushNamed(context, '/about');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
