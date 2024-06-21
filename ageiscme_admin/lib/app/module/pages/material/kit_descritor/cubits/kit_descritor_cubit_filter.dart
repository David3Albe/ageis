import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitDescritorCubitFilter extends Cubit<KitDescritorFilter> {
  KitDescritorCubitFilter()
      : super(
          KitDescritorFilter(
            numeroRegistros: 500,
            ordenarAtivosPrimeiro: true,
            ordernarPorCodDecrescente: true,
          ),
        );
}
