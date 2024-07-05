import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:flutter/material.dart';

class EscalaPageState {
  final bool loading;
  final EscalaSaveDTO? escala;
  final DateTime? data;
  final Key gridKey;
  EscalaPageState({
    required this.gridKey,
    this.loading = false,
    this.escala,
    this.data,
  });
}
