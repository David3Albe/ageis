import 'package:dependencias_comuns/bloc_export.dart';

class DropDownSearchCubit<T> extends Cubit<DropDownSearchState> {
  DropDownSearchCubit() : super(DropDownSearchState(items: [], loading: false));

  void SetItems(List<T> items) {
    emit(DropDownSearchState(items: items, loading: false, notFound: false));
  }

  void setLoading() {
    emit(
      DropDownSearchState(
        items: state.items,
        loading: true,
        notFound: false,
      ),
    );
  }

  void setNotFound() {
    emit(
      DropDownSearchState(
        items: state.items,
        loading: false,
        notFound: true,
      ),
    );
  }
}

class DropDownSearchState<T> {
  List<T> items;
  bool loading;
  bool notFound;

  DropDownSearchState({
    required this.items,
    this.loading = false,
    this.notFound = false,
  });
}
