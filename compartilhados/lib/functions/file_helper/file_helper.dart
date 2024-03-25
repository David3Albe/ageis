import 'dart:convert';
import 'dart:io';

import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/foundation.dart';

class FileHelper {
  static Future<FileObjectModel?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    if (kIsWeb) {
      String base64 = base64Encode(result.files.single.bytes!);
      String fileName = result.files.single.name;
      return FileObjectModel(base64: base64, fileName: fileName);
    }
    File imageFile = File(result.files.single.path!);
    List<int> bytes = await imageFile.readAsBytes();
    String base64 = base64Encode(bytes);
    String fileName = result.files.single.name;
    return FileObjectModel(base64: base64, fileName: fileName);
  }
}
