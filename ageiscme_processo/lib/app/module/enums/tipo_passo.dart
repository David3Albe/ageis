enum TipoPasso {
  Usuario,
  Local,
  Acao,
  Prioridade,
  Epi,
  Item,
  Finalizar,
}

class TipoPassoValue {
  static int getValue(TipoPasso tipoPasso) {
    switch (tipoPasso) {
      case TipoPasso.Usuario:
        return 1;
      case TipoPasso.Local:
        return 2;
      case TipoPasso.Acao:
        return 3;
      case TipoPasso.Prioridade:
        return 4;
      case TipoPasso.Epi:
        return 5;
      case TipoPasso.Item:
        return 6;
      case TipoPasso.Finalizar:
        return 7;
      default:
        throw Exception('Valor para tipo passo não definido');
    }
  }
}
