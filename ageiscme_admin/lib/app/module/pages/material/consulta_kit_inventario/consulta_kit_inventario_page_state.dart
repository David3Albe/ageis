import 'package:ageiscme_data/query_services/kit_inventario/consulta_kit_inventario_service.dart';
import 'package:ageiscme_models/query_filters/kit_inventario/consulta_kit_inventario_filter.dart';
import 'package:ageiscme_models/query_models/kit_inventario/consulta_kit_inventario_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaKitInventarioPageCubit
    extends Cubit<ConsultaKitInventarioPageState> {
  final ConsultaKitInventarioService service;
  ConsultaKitInventarioPageCubit({required this.service})
      : super(
          ConsultaKitInventarioPageState(
            kitsInventarios: [],
            loading: false,
          ),
        );

  void loadKitInventario(ConsultaKitInventarioFilter filter) async {
    emit(
      ConsultaKitInventarioPageState(
        loading: true,
        kitsInventarios: [],
      ),
    );
    try {
      (String, List<ConsultaKitInventarioModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaKitInventarioModel> kitsInventarios = itens.$2;
      emit(
        ConsultaKitInventarioPageState(
          loading: false,
          kitsInventarios: kitsInventarios,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaKitInventarioPageState(
          loading: false,
          kitsInventarios: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaKitInventarioPageState {
  final bool loading;
  final List<ConsultaKitInventarioModel> kitsInventarios;
  final String error;
  final String message;
  ConsultaKitInventarioPageState({
    required this.loading,
    required this.kitsInventarios,
    this.error = '',
    this.message = '',
  });
}
