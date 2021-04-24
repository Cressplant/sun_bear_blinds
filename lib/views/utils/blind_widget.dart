import 'package:flutter/material.dart';

class BlindWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool recess;
  final String image;

  BlindWidget({required this.height, required this.width, required this.image, required this.recess});

  @override
  Widget build(BuildContext context) {
    double _actualWidth = recess ? width - 2.5 : width;
    double _pixelHeight = height * 10; //* 10:1 pixels to CM
    double _pixelWidth = _actualWidth * 10; //*

    return Column(children: [
      Container(decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(3.0)), height: 24.0, width: _pixelWidth + 10.0),
      Container(
        height: _pixelHeight,
        width: _pixelWidth,
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image), fit: BoxFit.none, alignment: Alignment.bottomCenter)),
      ),
      Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3.0)), height: 14.0, width: _pixelWidth + 10.0),
    ]);
  }
}
