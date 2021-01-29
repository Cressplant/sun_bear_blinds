import 'package:flutter/material.dart';
import '../services/services.dart';


class BlindScreen extends StatelessWidget {

  final Blind blind;

  BlindScreen({this.blind});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(blind.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Globals.mediumVerticalSpacer,

            Hero(
              tag: blind.image,
              child: Card(
                clipBehavior: Clip.antiAlias,
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
                      Image.asset(
                        'images/${blind.image}',
                        fit: BoxFit.contain,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                blind.name,
                                style: TextStyle(
                                    height: 1.5, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                          ),
                          Text(blind.description)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Globals.mediumVerticalSpacer,

          ],
        ),
      ),
    );

  }

}