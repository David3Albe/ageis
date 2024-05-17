import 'package:ageiscme_data/services/insumo_teste/insumo_teste_service.dart';
import 'package:ageiscme_models/filters/insumo_teste/insumo_teste_filter.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoTestePageCubit extends Cubit<InsumoTestePageState> {
  final InsumoTesteService service;
  InsumoTestePageCubit({required this.service})
      : super(
          InsumoTestePageState(
            insumosTestes: [],
            loading: false,
          ),
        );

  // void loadInsumoMovimentoFilter(InsumoMovimentoFilter filter) async {
  //   emit(
  //     InsumoTestePageState(
  //       loading: true,
  //       insumosTestes: [],
  //     ),
  //   );
  //   try {
  //     List<InsumoTesteModel>? itens = await service.Filter(filter);
  //     List<InsumoTesteModel> insumosTestes = itens;
  //     emit(
  //       InsumoTestePageState(
  //         loading: false,
  //         insumosTestes: insumosTestes,
  //       ),
  //     );
  //   } on Exception catch (ex) {
  //     emit(
  //       InsumoTestePageState(
  //         loading: false,
  //         insumosTestes: [],
  //         error: ex.toString(),
  //       ),
  //     );
  //   }
  // }

  void loadInsumoTeste() async {
    emit(InsumoTestePageState(loading: true, insumosTestes: []));
    try {
      List<InsumoTesteModel> insumoTeste = await service.GetAll();
      emit(InsumoTestePageState(loading: false, insumosTestes: insumoTeste));
    } on Exception catch (ex) {
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  Future filter(InsumoTesteFilter filter) async {
    emit(
      InsumoTestePageState(loading: true, insumosTestes: []),
    );
    try {
      List<InsumoTesteModel> insumoTestes = await service.Filter(filter);
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: insumoTestes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  Future search(InsumoTesteFilter filter) async {
    emit(
      InsumoTestePageState(loading: true, insumosTestes: []),
    );
    try {
      List<InsumoTesteModel> insumoTestes = await service.Filter(filter);
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: insumoTestes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(InsumoTesteModel insumoTeste) async {
    try {
      (String, InsumoTesteModel)? result = await service.delete(insumoTeste);
      if (result == null) return;

      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: state.insumosTestes,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoTestePageState(
          loading: false,
          insumosTestes: state.insumosTestes,
          error: ex.toString(),
        ),
      );
    }
  }
}

class InsumoTestePageState {
  final bool loading;
  final bool deleted;
  final List<InsumoTesteModel> insumosTestes;
  final String error;
  final String message;

  InsumoTestePageState({
    required this.loading,
    required this.insumosTestes,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
