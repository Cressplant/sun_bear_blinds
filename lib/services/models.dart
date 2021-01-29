import 'package:flutter/material.dart';

class Blind {

  final String name;
  final String description;
  final int color;
  final Brightness brightness;
  final String image;
  final double smallPrice;
  final double mediumPrice;
  final double largePrice;
  double width;
  double height;

  Blind({
    this.name,
    this.description,
    this.color,
    this.brightness,
    this.image,
    this.smallPrice,
    this.mediumPrice,
    this.largePrice,
    this.width,
    this.height,
});

  factory Blind.fromMap(Map data){
    return Blind(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      color: data['color'] ?? '',
      brightness: data['brightness'] != null ? Brightness.values[data['brightness']] : Brightness.light,
      image: data['image'] ?? '',
      smallPrice: data['smallPrice'] ?? 0,
      mediumPrice: data['mediumPrice'] ?? 0,
      largePrice: data['largePrice'] ?? 0,
    );
  }


}