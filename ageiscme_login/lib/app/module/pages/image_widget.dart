import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    required this.identificador,
    required this.height,
    super.key,
  });
  final String identificador;
  final int height;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ImagemService().getUrlImage(identificador: widget.identificador),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        return Image.network(
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
          snapshot.data!,
          height: 60,
        );
      },
    );
  }
}
