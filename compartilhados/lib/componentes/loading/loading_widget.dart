import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key});
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Cores.corLoading,
    );
  }
}
