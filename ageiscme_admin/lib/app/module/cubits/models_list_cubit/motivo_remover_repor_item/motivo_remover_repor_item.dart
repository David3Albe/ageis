import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoRemoverReporItemCubit extends Cubit<MotivoRemoverReporItemState> {
  MotivoRemoverReporItemCubit()
      : super(MotivoRemoverReporItemState(motivos: []));

  void loadAll() async {
    emit(MotivoRemoverReporItemState(motivos: [], loading: true));
    List<MotivoRemoverReporItemModel> motivos =
        await MotivoRemoverReporItemService().GetAll();
    emit(
      MotivoRemoverReporItemState(
        motivos: motivos,
        loaded: true,
        loading: false,
      ),
    );
  }

  void clear() => emit(MotivoRemoverReporItemState(motivos: []));
}

class MotivoRemoverReporItemState {
  List<MotivoRemoverReporItemModel> motivos;
  bool loading;
  bool loaded;

  MotivoRemoverReporItemState({
    required this.motivos,
    this.loading = false,
    this.loaded = false,
  });
}
