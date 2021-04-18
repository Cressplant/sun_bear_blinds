import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/data/models/db.dart';
import 'package:sun_bear_blinds/data/models/user_preferences.dart';
import 'package:sun_bear_blinds/views/utils/blind_tile.dart';
import 'package:sun_bear_blinds/views/utils/dark_mode_switch.dart';
import 'package:sun_bear_blinds/views/utils/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Blind> _blinds = [];

  @override
  void initState() {
    _blinds = Database.blinds.values.map((value) => Blind.fromMap(value)).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                    color: _theme.cardColor,
                    image: DecorationImage(
                        image: AssetImage(_theme.brightness == Brightness.light ? 'assets/images/home_header_day.jpg' : 'assets/images/home_header_night.jpg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [_theme.cardColor, (_theme.brightness == Brightness.light ? Color(0x00ffffff) : Color(0x00000000))],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    )),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: DarkModeSwitch(
                          value: Provider.of<UserPreferences>(context, listen: false).darkMode,
                          onChanged: (_v) {
                            Provider.of<UserPreferences>(context, listen: false).updateUserPreferences(darkMode: _v);

                            // setState(() {
                            //   _darkMode = _v;
                            // });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0, bottom: 15.0),
                      child: Center(
                          // child: Row(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(2, 2), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(image: AssetImage('assets/images/sun_bear_logo.png'), fit: BoxFit.contain)),
                          ),
                          SizedBox(height: 10.0),
                          Text('Sun Bear Blinds', style: _theme.textTheme.headline3?.copyWith(fontSize: 26, fontWeight: FontWeight.bold) ?? TextStyle()),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ])),
            SliverAppBar(
                backgroundColor: _theme.cardColor,
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                expandedHeight: 0,
                bottom: PreferredSize(
                    // preferredSize: Size(double.infinity, 44.0),
                    preferredSize: Size(double.infinity, 44.0),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Which view will you choose?',
                          style: TextStyle(fontSize: 18),
                        )

                        // child: Text(
                        //   'Projects',
                        //   style: _theme.textTheme.headline3,
                        //   // style: TextStyle(color: Colors.white),
                        // ),

                        )))
          ],
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.0, top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Globals.mediumVerticalSpacer,

                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75 / 1.0,
                    ),
                    itemCount: _blinds.length,
                    itemBuilder: (context, index) => BlindTile(
                          blind: _blinds[index],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
