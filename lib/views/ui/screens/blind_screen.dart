import 'package:flutter/material.dart';
import 'package:sun_bear_blinds/business_logic/utils/colors.dart';
import 'package:sun_bear_blinds/business_logic/utils/spacers.dart';
import 'package:sun_bear_blinds/data/models/blind.dart';
import 'package:sun_bear_blinds/views/utils/blind_widget.dart';

class BlindScreen extends StatefulWidget {
  static const String id = '/window_blind';

  final Blind blind;

  BlindScreen({required this.blind});

  @override
  _BlindScreenState createState() => _BlindScreenState();
}

class _BlindScreenState extends State<BlindScreen> {
  double _width = 91.0; //! GET PRESET WIDTH
  double _height = 162.5; //! GET PRESET HEIGHT
  bool _recess = true;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: widget.blind.accentColor,
      appBar: AppBar(
        backgroundColor: widget.blind.accentColor,
        title: Text(widget.blind.name + ' Blind',
            style: _theme.textTheme.headline6?.copyWith(color: getContrastingTextColor(widget.blind.primaryColor)) ?? TextStyle()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // mediumVerticalSpacer,
            Hero(tag: widget.blind.image, child: FittedBox(child: BlindWidget(width: _width, height: _height, recess: _recess, image: widget.blind.image))),
            mediumVerticalSpacer,
            Text(widget.blind.description),
            mediumVerticalSpacer,
            TextFormField(),
            
          ],
        ),
      ),
    );
  }
}
