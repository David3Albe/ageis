import 'dart:convert';
import 'dart:typed_data';

import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.identificador,
    required this.height,
    super.key,
  });
  final String identificador;
  final int height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          ImagemService().getLogoIdentificador(identificador: identificador),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (snapshot.data?.foto == null) return const SizedBox();
        Uint8List bytes = base64Decode(snapshot.data!.foto!);

        return Image.memory(
          bytes,
          errorBuilder: (context, error, stackTrace) => const SizedBox(),
          height: 60,
        );
      },
    );
  }
}
