// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Fontes.getRoboto(
        fontSize: HelperFunctions.calculaFontSize(context, 19),
      ),
    );
  }
}
 