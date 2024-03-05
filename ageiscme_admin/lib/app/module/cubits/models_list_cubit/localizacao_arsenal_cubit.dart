import 'package:ageiscme_data/services/localizacao_arsenal/localizacao_arsenal_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalizacaoArsenalCubit extends Cubit<LocalizacaoArsenalState> {
  LocalizacaoArsenalCubit() : super(LocalizacaoArsenalState(objs: []));

  void loadAll() async {
    emit(LocalizacaoArsenalState(objs: [], loading: true));
    List<LocalizacaoArsenalModel> localizacaoArsenais =
        await LocalizacaoArsenalService().GetAll();
    emit(LocalizacaoArsenalState(objs: localizacaoArsenais));
  }

  void clear() => emit(LocalizacaoArsenalState(objs: []));
}

class LocalizacaoArsenalState {
  List<LocalizacaoArsenalModel> objs;
  bool loading;
  LocalizacaoArsenalState({required this.objs, this.loading = false});
}
