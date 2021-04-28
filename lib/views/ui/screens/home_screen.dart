import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sun_bear_blinds/business_logic/utils/formatting.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/business_logic/services/db.dart';
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
    bool _mobile = checkMobile(context);
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: Scrollbar(
        child: NestedScrollView(
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
                            top: 35.0,
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
                            padding: EdgeInsets.only(top: 60.0, bottom: 0.0),
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
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(_mobile ? 12.0 : 30.0),
                  sliver: SliverGrid.extent(
                      maxCrossAxisExtent: 600.0,
                      // crossAxisCount: 2,
                      childAspectRatio: 0.75 / 1.0,
                      children: _blinds
                          .map((_blind) => BlindTile(
                                blind: _blind,
                              ))
                          .toList()),
                  // sliver: SliverGrid.count(
                  //     crossAxisCount: 2,
                  //     childAspectRatio: 0.75 / 1.0,
                  //     children: _blinds
                  //         .map((_blind) => BlindTile(
                  //               blind: _blind,
                  //             ))
                  //         .toList()),
                )
              ],
            )

            // body: SingleChildScrollView(
            //   padding: EdgeInsets.only(bottom: 20.0, top: 15.0),
            //   child: Container(
            //     color: Colors.red,
            //     child: Row(
            //       children: [
            //         Container(
            //           width: 300.0,
            //           child: GridView.builder(
            //               physics: NeverScrollableScrollPhysics(),
            //               // padding: EdgeInsets.all(30.0),
            //               shrinkWrap: true,
            //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 childAspectRatio: 0.75 / 1.0,
            //               ),
            //               itemCount: _blinds.length,
            //               itemBuilder: (context, index) => BlindTile(
            //                     blind: _blinds[index],
            //                   )),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ),
      ),
    );
  }
}
