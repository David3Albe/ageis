import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:flutter/material.dart';

class ItemDescritorPageFrmImage extends StatefulWidget {
  final ItemDescritorModel item;
  ItemDescritorPageFrmImage({required this.item});
  @override
  State<ItemDescritorPageFrmImage> createState() =>
      _ItemDescritorPageFrmImageState();
}

class _ItemDescritorPageFrmImageState extends State<ItemDescritorPageFrmImage> {
  @override
  Widget build(BuildContext context) {
    return ImageDisplayWidget(imageBase64: widget.item.foto);
  }
}
