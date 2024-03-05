import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoPageCalculatorCubit extends Cubit<ProcessoPageCalculatorState> {
  ProcessoPageCalculatorCubit() : super(ProcessoPageCalculatorState());

  void addNumber(int number) {
    if (state.value == null || state.value!.toString().isEmpty) {
      state.value = 0;
    }
    String strValue = state.value.toString();
    strValue += number.toString();

    state.value = int.parse(
      strValue,
    );
    emit(ProcessoPageCalculatorState(value: state.value));
  }

  void Clean() {
    if (state.value == null || state.value!.toString().isEmpty) return;
    if (state.value.toString().length == 1) {
      emit(ProcessoPageCalculatorState(value: null));
      return;
    }
    String newValue =
        state.value.toString().substring(0, state.value.toString().length - 1);
    emit(ProcessoPageCalculatorState(value: int.parse(newValue)));
  }

  void Cancel() {
    emit(
      ProcessoPageCalculatorState(
        value: state.value,
        canceled: true,
      ),
    );
  }

  void Confirm() {
    emit(
      ProcessoPageCalculatorState(
        value: state.value,
        confirmed: true,
      ),
    );
  }
}

class ProcessoPageCalculatorState {
  int? value;
  bool? confirmed;
  bool? canceled;
  ProcessoPageCalculatorState({this.value, this.confirmed, this.canceled});
}
