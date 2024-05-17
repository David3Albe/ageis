import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/states/readonly_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ReadonlyCubit extends Cubit<ReadonlyState> {
  ReadonlyCubit()
      : super(
          ReadonlyState(
            botaoInserirVisible: true,
            botaoGerarVisible: true,
            txtEtiquetaReadonly: false,
            txtQuantidadeReadonly: false,
          ),
        );

  void setBotaoGerarVisible(bool visible) {
    emit(
      ReadonlyState(
        txtEtiquetaReadonly: state.txtEtiquetaReadonly,
        txtQuantidadeReadonly: state.txtQuantidadeReadonly,
        botaoGerarVisible: visible,
        botaoInserirVisible: state.botaoInserirVisible,
      ),
    );
  }

  void setTxtEtiquetaReadonly(bool readonly) {
    emit(
      ReadonlyState(
        txtEtiquetaReadonly: readonly,
        txtQuantidadeReadonly: state.txtQuantidadeReadonly,
        botaoGerarVisible: state.botaoGerarVisible,
        botaoInserirVisible: state.botaoInserirVisible,
      ),
    );
  }

  void setTxtQuantidadeReadonly(bool readonly) {
    emit(
      ReadonlyState(
        txtEtiquetaReadonly: state.txtEtiquetaReadonly,
        txtQuantidadeReadonly: readonly,
        botaoGerarVisible: state.botaoGerarVisible,
        botaoInserirVisible: state.botaoInserirVisible,
      ),
    );
  }

  void setBotaoInserirVisible(bool visible) {
    emit(
      ReadonlyState(
        txtEtiquetaReadonly: state.txtEtiquetaReadonly,
        txtQuantidadeReadonly: state.txtQuantidadeReadonly,
        botaoGerarVisible: state.botaoGerarVisible,
        botaoInserirVisible: visible,
      ),
    );
  }
}
