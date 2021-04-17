import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/data/models/db.dart';
import 'package:sun_bear_blinds/views/utils/blind_tile.dart';
import 'package:sun_bear_blinds/views/utils/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Blind> _blinds;

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
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Center(
                    // child: Row(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/sun_bear_logo.png', height: 80.0, width: 80.0),
                    SizedBox(height: 10.0),
                    Text('Sun Bear Blinds', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                )),
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
