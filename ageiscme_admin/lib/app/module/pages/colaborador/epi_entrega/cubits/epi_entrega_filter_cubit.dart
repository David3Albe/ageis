import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiEntregaFilterCubit extends Cubit<UsuarioFilter> {
  EpiEntregaFilterCubit()
      : super(
          UsuarioFilter(
            numeroRegistros: 500,
            carregarFoto: false,
            tipoQuery: UsuarioFilterTipoQuery.SemFoto,
            apenasAtivos: true,
            apenasColaboradores: true,
            ordenarPorAtivosPrimeiro: true,
          ),
        );
}
