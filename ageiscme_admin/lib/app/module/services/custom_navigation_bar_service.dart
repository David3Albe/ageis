import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/custom_navigation_bar_cubit.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CustomNavigationBarService {
  static void turnExpandedOff(BuildContext context) {
    context.read<CustomNavigationBarCubit>().turnExpandedOff();
  }
}
