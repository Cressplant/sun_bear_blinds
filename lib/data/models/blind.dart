import 'package:flutter/material.dart';

class Blind {
  final String name;
  final String description;
  final Color primaryColor;
  final Color accentColor;
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
    this.accentColor,
    this.primaryColor,
    this.brightness,
    this.image,
    this.smallPrice,
    this.mediumPrice,
    this.largePrice,
    this.width,
    this.height,
  });

  factory Blind.fromMap(Map data) {
    return Blind(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      primaryColor: Color(data['accentColor'] ?? 0xffffffff),
      accentColor: Color(data['primaryColor'] ?? 0xffffffff),
      brightness: data['brightness'] != null ? Brightness.values[data['brightness']] : Brightness.light,
      image: data['image'] ?? '',
      smallPrice: data['smallPrice'] ?? 0,
      mediumPrice: data['mediumPrice'] ?? 0,
      largePrice: data['largePrice'] ?? 0,
    );
  }
}
