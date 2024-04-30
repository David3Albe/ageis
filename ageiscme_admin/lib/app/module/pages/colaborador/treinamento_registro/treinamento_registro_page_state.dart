import 'package:ageiscme_data/services/treinamento_registro/treinamento_registro_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TreinamentoRegistroPageCubit extends Cubit<TreinamentoRegistroPageState> {
  final TreinamentoRegistroService service;
  TreinamentoRegistroPageCubit({required this.service})
      : super(
          TreinamentoRegistroPageState(
            treinamentosRegistros: [],
            loading: false,
          ),
        );

  void loadTreinamentoRegistro() async {
    emit(
      TreinamentoRegistroPageState(loading: true, treinamentosRegistros: []),
    );
    try {
      List<TreinamentoRegistroModel> treinamentosRegistros =
          await service.GetAll();
      emit(
        TreinamentoRegistroPageState(
          loading: false,
          treinamentosRegistros: treinamentosRegistros,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TreinamentoRegistroPageState(
          loading: false,
          treinamentosRegistros: [],
          error: ex.toString(),
        ),
      );
    }
  }

  Future filter(TreinamentoRegistroFilter filter) async {
    emit(
      TreinamentoRegistroPageState(loading: true, treinamentosRegistros: []),
    );
    try {
      List<TreinamentoRegistroModel> treinamentosRegistros =
          await service.Filter(filter);
      emit(
        TreinamentoRegistroPageState(
          loading: false,
          treinamentosRegistros: treinamentosRegistros,
        ),
      );
    } on Exception catch (ex) {
      emit(
        TreinamentoRegistroPageState(
          loading: false,
          treinamentosRegistros: [],
          error: ex.toString(),
        ),
      );
    }
  }

//   void delete(TreinamentoRegistroModel treinamentoRegistro) async {
//     try {
//       (String, TreinamentoRegistroModel)? result =
//           await service.delete(treinamentoRegistro);
//       if (result == null) return;
//       emit(
//         TreinamentoRegistroPageState(
//           loading: false,
//           treinamentosRegistros: state.treinamentosRegistros,
//           deleted: true,
//           message: result.$1,
//         ),
//       );
//     } on Exception catch (ex) {
//       emit(
//         TreinamentoRegistroPageState(
//           loading: false,
//           treinamentosRegistros: state.treinamentosRegistros,
//           error: ex.toString(),
//         ),
//       );
//     }
//   }
// }

  void delete(TreinamentoRegistroModel treinamentoRegistro) async {
    try {
      (String, TreinamentoRegistroModel)? result =
          await service.delete(treinamentoRegistro);
      if (result == null) return;
      emit(
        TreinamentoRegistroPageState(
          loading: false,
          treinamentosRegistros: state.treinamentosRegistros,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (_) {}
  }
}

class TreinamentoRegistroPageState {
  final bool loading;
  final bool deleted;
  final List<TreinamentoRegistroModel> treinamentosRegistros;
  final String error;
  final String message;

  TreinamentoRegistroPageState({
    required this.loading,
    required this.treinamentosRegistros,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
