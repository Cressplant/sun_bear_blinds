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
        title: Text(widget.blind.name + ' Blind', style: _theme.textTheme.headline6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // mediumVerticalSpacer,
            Hero(
                tag: widget.blind.image,
                child: AspectRatio(
                    aspectRatio: 1.0, child: FittedBox(child: BlindWidget(width: _width, height: _height, recess: _recess, image: widget.blind.image)))),
            largeVerticalSpacer,

            Text(
              'What are your window\'s dimensions?',
              textAlign: TextAlign.center,
              style: _theme.textTheme.headline2,
            ),
            mediumVerticalSpacer,
            Text(
              'We alter our blinds so you don\'t have to, and prices depend on the size of the blind you require.',
              textAlign: TextAlign.center,
              style: _theme.textTheme.caption,
            ),

            mediumVerticalSpacer,

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Width (cm)',
                        style: _theme.textTheme.headline2,
                      )),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Max: 149'),
                        ),
                      ),
                    ],
                  ),
                  mediumVerticalSpacer,
                  // s,
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Drop (cm)',
                        style: _theme.textTheme.headline2,
                      )),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Max: 159'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            mediumVerticalSpacer,

            Container(
              height: 150.0,
              child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Container(
                          child: TabBar(
                              // isScrollable: true,
                              // labelStyle: Theme.of(context).textTheme.headline1.copyWith(fontSize: 16),
                              // unselectedLabelStyle: Theme.of(context).textTheme.headline2.copyWith(fontSize: 14),
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(5),
                                  ),
                                  color: _theme.cardColor),
                              tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Delivery'),
                            Tab(text: 'Measuring'),
                          ])),
                      Expanded(
                        child: TabBarView(
                            children: [widget.blind.description, widget.blind.description, widget.blind.description]
                                .map(
                                  (_sectionText) => Container(
                                      decoration: BoxDecoration(color: _theme.cardColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
                                      padding: EdgeInsets.all(15.0),
                                      child: Center(child: Text(_sectionText))),
                                )
                                .toList()),
                      )
                    ],
                  )),
            ),

            largeVerticalSpacer
          ],
        ),
      ),
    );
  }
}
