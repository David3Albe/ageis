import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoRemoverReporItemPageCubit
    extends Cubit<MotivoRemoverReporItemPageState> {
  final MotivoRemoverReporItemService service;
  MotivoRemoverReporItemPageCubit({required this.service})
      : super(
          MotivoRemoverReporItemPageState(
            motivoRemoverReporItens: [],
            loading: false,
          ),
        );

  void loadMotivoRemoverReporItem() async {
    emit(
      MotivoRemoverReporItemPageState(
        loading: true,
        motivoRemoverReporItens: [],
      ),
    );
    try {
      List<MotivoRemoverReporItemModel> motivoRemoverReporItens =
          await service.GetAll();
      emit(
        MotivoRemoverReporItemPageState(
          loading: false,
          motivoRemoverReporItens: motivoRemoverReporItens,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoRemoverReporItemPageState(
          loading: false,
          motivoRemoverReporItens: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(MotivoRemoverReporItemModel motivoRemoverReporItem) async {
    try {
      (String, MotivoRemoverReporItemModel)? result =
          await service.delete(motivoRemoverReporItem);
      if (result == null) return;

      emit(
        MotivoRemoverReporItemPageState(
          loading: false,
          motivoRemoverReporItens: state.motivoRemoverReporItens,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoRemoverReporItemPageState(
          loading: false,
          motivoRemoverReporItens: state.motivoRemoverReporItens,
          error: ex.toString(),
        ),
      );
    }
  }
}

class MotivoRemoverReporItemPageState {
  final bool loading;
  final bool deleted;
  final List<MotivoRemoverReporItemModel> motivoRemoverReporItens;
  final String error;
  final String message;

  MotivoRemoverReporItemPageState({
    required this.loading,
    required this.motivoRemoverReporItens,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
