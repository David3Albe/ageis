import 'package:ageiscme_login/app/module/cubits/module_selection/module_selection_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ModuleSelectionCubit extends Cubit<ModuleSelectionState> {
  ModuleSelectionCubit() : super(ModuleSelectionInitState());

  void changeHover(bool hover) {
    emit(ModuleSelectionChangedState(hover));
  }
}
