import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('404 ERROR', style: Theme.of(context).textTheme.headline1),
              Text('Page not found.'),
            ],
          ),
        ));
  }
}
