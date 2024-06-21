import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TreinamentoRegistroCubitFilter extends Cubit<TreinamentoRegistroFilter> {
  TreinamentoRegistroCubitFilter()
      : super(
          TreinamentoRegistroFilter(
            numeroRegistros: 500,
            carregarUsuario: true,
            ordenarPorDataDecrescente: true,
          ),
        );
}
