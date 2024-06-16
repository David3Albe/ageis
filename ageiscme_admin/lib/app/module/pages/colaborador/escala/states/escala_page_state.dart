import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';

class EscalaPageState {
  final bool loading;
  final EscalaSaveDTO? escala;
  final DateTime? data;
  EscalaPageState({
    this.loading = false,
    this.escala,
    this.data,
  });
}
