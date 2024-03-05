import 'package:ageiscme_data/services/motivo_quebra_fluxo/motivo_quebra_fluxo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoQuebraFluxoPageCubit extends Cubit<MotivoQuebraFluxoPageState> {
  final MotivoQuebraFluxoService service;
  MotivoQuebraFluxoPageCubit({required this.service})
      : super(
          MotivoQuebraFluxoPageState(
            motivosQuebrasFluxo: [],
            loading: false,
          ),
        );

  void loadMotivoQuebraFluxo() async {
    emit(MotivoQuebraFluxoPageState(loading: true, motivosQuebrasFluxo: []));
    try {
      List<MotivoQuebraFluxoModel> motivosQuebrasFluxo = await service.GetAll();
      emit(
        MotivoQuebraFluxoPageState(
          loading: false,
          motivosQuebrasFluxo: motivosQuebrasFluxo,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoQuebraFluxoPageState(
          loading: false,
          motivosQuebrasFluxo: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(MotivoQuebraFluxoModel motivoQuebraFluxo) async {
    try {
      (String, MotivoQuebraFluxoModel)? result =
          await service.delete(motivoQuebraFluxo);
      if (result == null) return;

      emit(
        MotivoQuebraFluxoPageState(
          loading: false,
          motivosQuebrasFluxo: state.motivosQuebrasFluxo,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoQuebraFluxoPageState(
          loading: false,
          motivosQuebrasFluxo: state.motivosQuebrasFluxo,
          error: ex.toString(),
        ),
      );
    }
  }
}

class MotivoQuebraFluxoPageState {
  final bool loading;
  final bool deleted;
  final List<MotivoQuebraFluxoModel> motivosQuebrasFluxo;
  final String error;
  final String message;

  MotivoQuebraFluxoPageState({
    required this.loading,
    required this.motivosQuebrasFluxo,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
