import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sun_bear_blinds/business_logic/utils/formatting.dart';
import 'package:sun_bear_blinds/business_logic/utils/globals.dart';
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
  final GlobalKey _formKey = GlobalKey<FormState>();
  double _widthInCM = Globals.maxWidth;
  double _heightInCM = Globals.maxDrop;
  bool _recess = true;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    bool _mobile = checkMobile(context);
    bool _darkMode = _theme.brightness == Brightness.light;

    return Scaffold(
      backgroundColor: _darkMode ? widget.blind.backgroundLight : widget.blind.backgroundDark,
      // appBar: AppBar(
      //   backgroundColor: _darkMode ? widget.blind.backgroundLight : widget.blind.backgroundDark,
      //   title: Text(widget.blind.name + ' Blind', style: _theme.textTheme.headline6),
      //   centerTitle: true,
      // ),
      body: Scrollbar(
        child: ListView(
          children: [
            AppBar(
              backgroundColor: _darkMode ? widget.blind.backgroundLight : widget.blind.backgroundDark,
              title: Text(widget.blind.name + ' Blind', style: _theme.textTheme.headline6),
              centerTitle: true,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700.0),
                  child: Column(
                    children: [
                      // mediumVerticalSpacer,
                      Hero(
                          tag: widget.blind.image,
                          child: AspectRatio(aspectRatio: 1.0, child: FittedBox(child: BlindWidget(width: _widthInCM, height: _heightInCM, recess: _recess, image: widget.blind.image)))),
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
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 250.0),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Width (cm)',
                                      style: _theme.textTheme.headline3,
                                    )),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(hintText: 'Max: ${Globals.maxWidth}'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                                        ],
                                        validator: (_t) {
                                          if (_t != null && _t.isNotEmpty) {
                                            double _asDouble = double.parse(_t);

                                            if (_asDouble > Globals.maxWidth) {
                                              return 'Width can\'t be more than ${Globals.maxWidth}cm';
                                            } else if (_asDouble < Globals.minWidth) {
                                              return 'Width can\'t be less than ${Globals.minWidth}cm.';
                                            } else {
                                              //* can't be called here as fires multiple times, calling setstate during rebuild
                                              // setState(() {
                                              //   _widthInCM = _asDouble;
                                              // });

                                              return null;
                                            }
                                          } else
                                            return 'Width can\'t be left blank.';
                                        },
                                        onChanged: (_t) {
                                          if (_t.isNotEmpty) {
                                            double _asDouble = double.parse(_t);

                                            if (_asDouble > Globals.maxWidth) {
                                            } else if (_asDouble < Globals.minWidth) {
                                            } else {
                                              setState(() {
                                                _widthInCM = double.parse(_t);
                                              });
                                            }
                                          }
                                        },
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
                                      style: _theme.textTheme.headline3,
                                    )),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(hintText: 'Max: ${Globals.maxDrop}'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                                        ],
                                        validator: (_t) {
                                          if (_t != null && _t.isNotEmpty) {
                                            double _asDouble = double.parse(_t);

                                            if (_asDouble > Globals.maxDrop) {
                                              return 'Drop can\'t be more than ${Globals.maxDrop}cm';
                                            } else if (_asDouble < Globals.minDrop) {
                                              return 'Drop can\'t be less than ${Globals.minDrop}cm.';
                                            } else {
                                              //* can't be called here as fires multiple times, calling setstate during rebuild
                                              // setState(() {
                                              //   _heightInCM = _asDouble;
                                              // });

                                              return null;
                                            }
                                          } else
                                            return 'Drop can\'t be left blank.';
                                        },
                                        onChanged: (_t) {
                                          if (_t.isNotEmpty) {
                                            double _asDouble = double.parse(_t);

                                            if (_asDouble > Globals.maxDrop) {
                                            } else if (_asDouble < Globals.minDrop) {
                                            } else {
                                              setState(() {
                                                _heightInCM = double.parse(_t);
                                              });
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      largeVerticalSpacer,

                      Container(
                        height: _mobile ? 320.0 : 240.0,
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
                                      children: [widget.blind.description, Globals.deliveryGuide, Globals.measuringGuide]
                                          .map(
                                            (_sectionText) => Container(
                                                decoration: BoxDecoration(color: _theme.cardColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
                                                padding: EdgeInsets.all(15.0),
                                                child: Text(_sectionText)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
