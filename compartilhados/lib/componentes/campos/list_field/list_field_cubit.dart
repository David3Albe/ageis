import 'package:dependencias_comuns/bloc_export.dart';

class ListFieldCubit<T> extends Cubit<ListFieldState> {
  ListFieldCubit() : super(ListFieldState(itemSelecionado: null));

  void trocarItemSelecionado(T? item) {
    emit(ListFieldState(itemSelecionado: item));
  }
}

class ListFieldState<T> {
  T? itemSelecionado;

  ListFieldState({required T? this.itemSelecionado});
}
