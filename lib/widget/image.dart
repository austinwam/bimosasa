import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class Imageplace extends StatelessWidget {
  final double height, width;
  final String imageurl;
  const Imageplace(
      {super.key,
      required this.height,
      required this.width,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ExtendedImage.network(
        imageurl,
        width: width,
        height: height,
        fit: BoxFit.fill,
        cache: true,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }
}
