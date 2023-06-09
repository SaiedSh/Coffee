import 'package:flutter/material.dart';

class ProductModel {
  final double imageWidth, imageHeight, borderWidth, titleSize, stringSize;
  final String imagePath, mainTitle, stringOne, tags, perTitle;

  final Color postColor, postBorderColor;
  final BorderRadius borderRadius;
  ProductModel(
      {required this.imageWidth,
      required this.imageHeight,
      required this.borderWidth,
      required this.titleSize,
      required this.stringSize,
      required this.imagePath,
      required this.mainTitle,
      required this.stringOne,
      required this.postColor,
      required this.postBorderColor,
      required this.borderRadius,
      required this.tags,
      required this.perTitle});
}
