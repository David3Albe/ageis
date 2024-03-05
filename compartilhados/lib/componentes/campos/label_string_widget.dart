import 'package:flutter/material.dart';

class LabelStringWidget extends StatelessWidget {
  final String? text;

  const LabelStringWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Text(
        '$text',
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
