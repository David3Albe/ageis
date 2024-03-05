import 'dart:convert';
import 'package:flutter/material.dart';

class ImageDisplayWidget extends StatelessWidget {
  final String? imageBase64;

  ImageDisplayWidget({required this.imageBase64});

  @override
  Widget build(BuildContext context) {
    String imageBase64 = this.imageBase64 == null ? '' : this.imageBase64!;
    final bytes = base64Decode(imageBase64);
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
      child: bytes.isNotEmpty ? Image.memory(bytes, ) : null,
    );
  }
}
