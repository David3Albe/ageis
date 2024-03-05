import 'package:flutter/material.dart';

class ImageMemoryDisplayWidget extends StatelessWidget {
  final Image? image;
  const ImageMemoryDisplayWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minWidth: size.width * .1,
        minHeight: size.height * .1,
        maxHeight: size.height * .2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: image ?? const SizedBox(),
    );
  }
}
