import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';

class ImageBase64Widget extends StatelessWidget {
  ImageBase64Widget(String base64Str) {
    bytes = base64.decode(base64Str);
  }
  late final Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    Image img = Image.memory(
      bytes,
      fit: BoxFit.contain,
    );
    return img;
  }
}
