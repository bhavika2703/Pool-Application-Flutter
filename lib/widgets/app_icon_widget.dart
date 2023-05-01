import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final image;
  final bool isFromSplash;

  const AppIconWidget({
    Key? key,
    this.image,
    this.isFromSplash = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getting screen size
    var size = MediaQuery.of(context).size;

    //calculating container width
    double imageSize;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      imageSize = isFromSplash ? (size.width * 0.80) : (size.width * 0.60);
    } else {
      imageSize = (size.height * 0.20);
    }

    return Image.asset(
      image,
      height: imageSize,
    );
  }
}
