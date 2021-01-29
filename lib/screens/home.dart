import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/services/db.dart';
import 'package:sun_bear_blinds/shared/navigation_bar.dart';
import '../services/services.dart';
import '../screens/screens.dart';


class HomeScreen extends StatefulWidget {
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


    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sun Bear Blinds', style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          fontWeight: FontWeight.bold
        )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.0, top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Center(
              child: Text(
                'Which view will you choose?',
                style: TextStyle(
                    fontSize: 18
                ),
              ),
            ),

            Globals.mediumVerticalSpacer,

          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75/1.0,
              ),
              itemCount: _blinds.length,
              itemBuilder: (context, index) => BlindItem(blind: _blinds[index],)
          )

          ],
        ),
      ),
    );
  }
}


class BlindItem extends StatelessWidget {

  final Blind blind;

  const BlindItem({this.blind});

  @override
  Widget build(BuildContext context) {

    Color _color = Color(blind.color);

    return Padding(
      padding: EdgeInsets.all(12),
      child: Hero(
      tag: blind.image,
      child: Material(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(2.0),
            boxShadow: [
              BoxShadow(
                color: _color.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => BlindScreen(blind: blind),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/${blind.image}',),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover
                    )
                    ),
                  )
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      blind.name,
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        color: blind.brightness == Brightness.dark ? Colors.white : Colors.black
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
