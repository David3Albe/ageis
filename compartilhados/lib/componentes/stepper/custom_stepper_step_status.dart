enum CustomStepperStepStatus {
  Concluido,
  Andamento,
  Aberto,
}

class CustomStepperStepStatusValue {
  static int getValue(CustomStepperStepStatus value) {
    switch (value) {
      case CustomStepperStepStatus.Aberto:
        return 1;
      case CustomStepperStepStatus.Andamento:
        return 2;
      case CustomStepperStepStatus.Concluido:
        return 3;
      default:
        throw Exception('Valor da CustomstepperStepStatusValue não definido');
    }
  }
}
