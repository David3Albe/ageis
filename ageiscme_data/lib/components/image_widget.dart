import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.identificador,
    required this.width,
    super.key,
  });
  final String identificador;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ImagemService().getUrlImage(identificador: identificador),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        return Image.network(
          errorBuilder: (context, error, stackTrace) => const SizedBox(),
          snapshot.data!,
          width: width,
        );
      },
    );
  }
}
