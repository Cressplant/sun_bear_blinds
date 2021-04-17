import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/views/ui/screens/blind_screen.dart';

class BlindTile extends StatelessWidget {
  final Blind blind;

  const BlindTile({this.blind});

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
                            image: AssetImage(
                              blind.image
                            ),
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover)),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        blind.name,
                        style: TextStyle(height: 1.5, fontWeight: FontWeight.bold, color: blind.brightness == Brightness.dark ? Colors.white : Colors.black),
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
