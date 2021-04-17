import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/business_logic/utils/spacers.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';

class BlindScreen extends StatelessWidget {
  static const String id = '/window_blind';

  final Blind blind;

  BlindScreen({this.blind});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blind.backgroundColor,
        title: Text(blind.name + ' Blind'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mediumVerticalSpacer,
            Hero(
              tag: blind.image,
              child: Container(
                height: 300,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(blind.image), fit: BoxFit.cover, alignment: Alignment.bottomCenter)),
              ),
            ),
            Text(blind.description),
            mediumVerticalSpacer
          ],
        ),
      ),
    );
  }
}
