import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemDescritorCubitFilter extends Cubit<ItemDescritorFilter> {
  ItemDescritorCubitFilter()
      : super(
          ItemDescritorFilter(
            numeroMaximoRegistros: 500,
            ordenarAtivosPrimeiro: true,
            ordenarCodigoDesc: true,
          ),
        );
}
