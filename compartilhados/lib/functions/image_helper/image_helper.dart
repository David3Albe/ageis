import 'dart:convert';
import 'dart:io';

import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/file_picker_export.dart';
import 'package:flutter/foundation.dart';

class ImageHelper {
  static const List<String> _ALLOWED_EXTENSIONS = [
    'jpg',
    'jpeg',
    'png',
    'Webp',
  ];

  static Future<ImageObjectModel?> selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _ALLOWED_EXTENSIONS,
    );
    if (result == null) return null;
    if (kIsWeb) {
      String base64 = base64Encode(result.files.single.bytes!);
      String fileName = result.files.single.name;
      return ImageObjectModel(base64: base64, fileName: fileName);
    }
    File imageFile = File(result.files.single.path!);
    List<int> bytes = await imageFile.readAsBytes();
    String base64 = base64Encode(bytes);
    String fileName = result.files.single.name;
    return ImageObjectModel(base64: base64, fileName: fileName);
  }
}
