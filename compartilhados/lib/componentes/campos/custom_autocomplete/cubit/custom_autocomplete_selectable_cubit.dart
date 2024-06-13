import 'package:compartilhados/componentes/campos/custom_autocomplete/state/custom_autocomplete_selectable_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class CustomAutocompleteSelectableCubit<T>
    extends Cubit<CustomAutocompleteSelectableState<T>> {
  CustomAutocompleteSelectableCubit()
      : super(CustomAutocompleteSelectableState());

  void setItem(T? item) {
    emit(CustomAutocompleteSelectableState(item: item));
  }
}
