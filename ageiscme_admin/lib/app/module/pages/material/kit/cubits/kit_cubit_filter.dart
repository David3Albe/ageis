import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitCubitFilter extends Cubit<KitSearchDTO> {
  KitCubitFilter()
      : super(
          KitSearchDTO(
            numeroRegistros: 500,
            ordenarCod: true,
          ),
        );
}
