import 'package:ageiscme_data/services/processo_leitura_andamento/processo_leitura_andamento_service.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/filter/processo_leitura_andamento_detail_filter_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/grid_data/processo_leitura_andamento_grid_data_detail_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/item/processo_leitura_andamento_item_detail_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/kit/processo_leitura_andamento_kit_detail_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_andamento/detail/processo_leitura_andamento_detail_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LiberacaoLeiturasDetalhamentoPageCubit
    extends Cubit<LiberacaoLeiturasDetalhamentoPageState> {
  final ProcessoLeituraAndamentoService service;
  LiberacaoLeiturasDetalhamentoPageCubit({required this.service})
      : super(
          LiberacaoLeiturasDetalhamentoPageState(
            leituras: [],
            data: null,
            loading: false,
          ),
        );

  void loadLeitura({required int cod, required int codUsuario}) async {
    emit(
      LiberacaoLeiturasDetalhamentoPageState(
        loading: true,
        data: null,
        leituras: [],
      ),
    );
    try {
      (String, ProcessoLeituraAndamentoDetailDTO)? result =
          await service.Detail(
        ProcessoLeituraAndamentoDetailFilterDTO(
          cod: cod,
          codUsuario: codUsuario,
        ),
      );
      if (result == null) return;
      List<ProcessoLeituraAndamentoGridDataDetailDTO> data =
          getData(leitura: result.$2);

      emit(
        LiberacaoLeiturasDetalhamentoPageState(
          loading: false,
          data: result.$2,
          leituras: data,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LiberacaoLeiturasDetalhamentoPageState(
          loading: false,
          leituras: [],
          data: null,
          error: ex.toString(),
        ),
      );
    }
  }

  List<ProcessoLeituraAndamentoGridDataDetailDTO> getData({
    required ProcessoLeituraAndamentoDetailDTO leitura,
  }) {
    List<ProcessoLeituraAndamentoGridDataDetailDTO> data = [];
    for (ProcessoLeituraAndamentoKitDetailDTO kit in leitura.kits) {
      data.add(
        ProcessoLeituraAndamentoGridDataDetailDTO(
          codBarraKit: kit.codBarra,
          descricaoKit: kit.descricao,
          codKit: kit.cod,
        ),
      );
      for (ProcessoLeituraAndamentoItemDetailDTO item in kit.itens) {
        data.add(
          ProcessoLeituraAndamentoGridDataDetailDTO(
            idEtiquetaItem: item.idEtiqueta,
            descricaoItem: item.descricao,
            codItem: item.cod,
            codBarraKit: kit.codBarra,
            codKit: kit.cod,
            descricaoKit: kit.descricao,
          ),
        );
      }
    }
    for (ProcessoLeituraAndamentoItemDetailDTO item in leitura.itens) {
      data.add(
        ProcessoLeituraAndamentoGridDataDetailDTO(
          idEtiquetaItem: item.idEtiqueta,
          descricaoItem: item.descricao,
          codItem: item.cod,
        ),
      );
    }
    return data;
  }
}

class LiberacaoLeiturasDetalhamentoPageState {
  final bool loading;
  final List<ProcessoLeituraAndamentoGridDataDetailDTO> leituras;
  final ProcessoLeituraAndamentoDetailDTO? data;
  final String error;
  final String message;

  LiberacaoLeiturasDetalhamentoPageState({
    required this.loading,
    required this.leituras,
    required this.data,
    this.error = '',
    this.message = '',
  });
}
