import 'package:ageiscme_data/query_services/kit/consulta_kit_service.dart';
import 'package:ageiscme_models/query_filters/kit/consulta_kit_filter.dart';
import 'package:ageiscme_models/query_models/kit/consulta_kit_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaKitPageCubit extends Cubit<ConsultaKitPageState> {
  final ConsultaKitService service;
  ConsultaKitPageCubit({required this.service})
      : super(
          ConsultaKitPageState(
            kits: [],
            loading: false,
          ),
        );

  void loadKitConsulta(ConsultaKitFilter filter) async {
    emit(
      ConsultaKitPageState(loading: true, kits: []),
    );
    try {
      (String, List<ConsultaKitModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaKitModel> kits = itens.$2;
      emit(
        ConsultaKitPageState(
          loading: false,
          kits: kits,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaKitPageState(
          loading: false,
          kits: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaKitPageState {
  final bool loading;
  final List<ConsultaKitModel> kits;
  final String error;
  final String message;

  ConsultaKitPageState({
    required this.loading,
    required this.kits,
    this.error = '',
    this.message = '',
  });
}
