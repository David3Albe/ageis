import 'package:flutter/material.dart';

class FormAlertDialogWidget extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  const FormAlertDialogWidget({this.title, this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      titlePadding: const EdgeInsets.all(16.0),
      actionsPadding: const EdgeInsets.all(16.0),
      title: title,
      content: content,
      actions: actions,
    );
  }
}
