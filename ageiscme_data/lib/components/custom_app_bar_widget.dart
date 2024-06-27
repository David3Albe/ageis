import 'dart:convert';

import 'package:ageiscme_data/components/image_widget.dart';
import 'package:ageiscme_data/cubits/imagem_cubit/imagem_cubit.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/appbar/logout_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key? key,
    this.onLogout,
    required this.body,
    this.drawer,
    this.title,
  });
  final Widget? title;
  final Widget body;
  final Widget? drawer;
  final void Function()? onLogout;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double getToolbarHeight(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 52;
    } else if (height > 900) {
      return 48;
    } else if (height > 800) {
      return 44;
    } else if (height > 700) {
      return 40;
    } else if (height > 600) {
      return 36;
    } else if (height > 500) {
      return 34;
    } else if (height > 400) {
      return 32;
    }
    return 30;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = getToolbarHeight(size);
    bool resumeView = size.width < 800;
    bool smallSizeImage = size.width < 500;
    bool microSizeImage = size.width < 400;
    bool veryMicroSizeImage = size.width < 300;
    return Scaffold(
      drawer: widget.drawer,
      appBar: AppBar(
        toolbarHeight: height,
        backgroundColor: Cores.materialCorPrincipal,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: resumeView ? 36.0 : 4.0),
            child: ImageWidget(
              width: veryMicroSizeImage
                  ? 70
                  : microSizeImage
                      ? 100
                      : smallSizeImage
                          ? 150
                          : 200,
              identificador: 'logo_esquerdo',
            ),
          ),
          widget.title == null
              ? const Spacer()
              : Expanded(child: Center(child: widget.title!)),
          ImageWidget(
            width: veryMicroSizeImage
                ? 70
                : microSizeImage
                    ? 100
                    : smallSizeImage
                        ? 150
                        : 200,
            identificador: 'logo_direito',
          ),
          Center(child: LogoutWidget(onLogout: widget.onLogout)),
        ],
      ),
      body: widget.body,
    );
  }

  Image? loadImagem(String identificador, ImagemState state) {
    ImagemModel? imagem = state.imagens
        .where((element) => element.identificadorImagem == identificador)
        .firstOrNull;
    if (imagem?.foto == null) return null;
    String imageBase64 = imagem?.foto == null ? '' : imagem!.foto!;
    final bytes = base64Decode(imageBase64);
    Image image = Image.memory(
      bytes,
    );
    return image;
  }
}
