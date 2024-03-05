import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DropDownCubit<T> extends Cubit<List<DropdownMenuItem<T>>> {
  DropDownCubit() : super([]);

  void SetItems(List<DropdownMenuItem<T>> items) {
    emit(items);
  }
}
