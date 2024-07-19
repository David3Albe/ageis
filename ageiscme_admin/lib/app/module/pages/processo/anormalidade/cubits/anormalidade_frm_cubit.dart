import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/frm/page/liberacao/anormalidade_frm_liberacao_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/states/anormalidade_frm_state.dart';
import 'package:ageiscme_data/services/anormalidade/anormalidade_service.dart';
import 'package:ageiscme_data/services/processo_registro/processo_registro_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/anormalidade/liberar/anormalidade_liberar_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/query_one/anormalidade_query_one_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/save/anormalidade_save_dto.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/processo_registro/ultimo/processo_registro_ultimo_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:ageiscme_models/response_dto/anormalidade/liberar/anormalidade_liberar_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/save/anormalidade_save_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/drop_down_search/item_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_registro/ultimo/processo_registro_ultimo_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeFrmCubit extends Cubit<AnormalidadeFrmState> {
  AnormalidadeFrmCubit() : super(AnormalidadeFrmState());

  Future _loadEmpty() async {
    AnormalidadeSaveDTO dto = await _getEmptyDTO();

    emit(
      AnormalidadeFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  Future<AnormalidadeSaveDTO> _getEmptyDTO() async {
    AnormalidadeSaveDTO dto = AnormalidadeSaveDTO.empty();
    AuthenticationResultDTO? result =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    if (result?.usuario == null) {
      emit(
        AnormalidadeFrmState(
          dto: dto,
          dtoOriginal: dto,
        ),
      );
      return dto;
    }
    dto.usuario = UsuarioDropDownSearchResponseDTO(
      ativo: result!.usuario!.ativo ?? false,
      cod: result.usuario!.cod!,
      codBarra: result.usuario!.codBarra!,
      nome: result.usuario!.nome,
    );
    dto.codUsuario = result.usuario!.cod;
    dto.dataHora = DateTime.now();
    return dto;
  }

  void load({
    required int? cod,
    required BuildContext context,
  }) async {
    emit(AnormalidadeFrmState(loading: true));
    if (cod == null || cod == 0) {
      await _loadEmpty();
      return;
    }
    AnormalidadeService service = Modular.get<AnormalidadeService>();
    (String, AnormalidadeSaveDTO)? result =
        await service.queryOne(dto: AnormalidadeQueryOneDTO(cod: cod));
    if (result == null) {
      emit(AnormalidadeFrmState());
      return;
    }
    emit(AnormalidadeFrmState(dto: result.$2, dtoOriginal: result.$2));
  }

  Future clear() async {
    AnormalidadeSaveDTO dto = await _getEmptyDTO();
    emit(
      AnormalidadeFrmState(
        dto: dto,
        dtoOriginal: dto,
      ),
    );
  }

  Future salvar({
    required BuildContext context,
    required void Function() onSaved,
  }) async {
    if (state.dto == null) return;
    if (state.dto?.item == null && state.dto?.etapa == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item ou Etapa devem ser informados',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeSaveResponseDTO)? result =
        await Modular.get<AnormalidadeService>().save(state.dto!);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    onSaved();
  }

  void _change({
    required AnormalidadeSaveDTO dto,
  }) {
    emit(AnormalidadeFrmState(dto: dto, dtoOriginal: state.dtoOriginal));
  }

  void changeDescription(
    String descricao,
  ) {
    if (state.dto == null) return;
    state.dto!.descricao = descricao;
    _change(dto: state.dto!);
  }

  void changeObservacaoLiberacao(
    String observacaoLiberacao,
  ) {
    if (state.dto == null) return;
    state.dto!.observacaoLiberacao = observacaoLiberacao;
    _change(dto: state.dto!);
  }

  Future changeEtapa({
    required ProcessoEtapaModel? etapa,
    required BuildContext context,
  }) async {
    if (state.dto == null) return;
    state.dto!.etapa = etapa;
    state.dto?.codProcessoEtapa = etapa?.cod;
    await _changeProcessoRegistro(context: context);
    _change(dto: state.dto!);
  }

  Future _changeProcessoRegistro({
    required BuildContext context,
  }) async {
    if (state.dto?.codProcessoEtapa == null && state.dto?.codItem == null) {
      state.dto?.codRegistroProcesso = null;
      state.dto?.processoRegistro = null;
      return;
    }
    LoadingController loading = LoadingController(context: context);
    (String, ProcessoRegistroUltimoResponseDTO)? result =
        await Modular.get<ProcessoRegistroService>().ultimo(
      ProcessoRegistroUltimoDTO(
        carregarEtapa: true,
        codEtapa: state.dto?.codProcessoEtapa,
        codItem: state.dto?.codItem,
        incluirEstoque: false,
      ),
    );
    loading.closeDefault();
    if (result == null) {
      _clearItemEtapaRegistro();
      return;
    }
    if (result.$2.cod == null) {
      _clearItemEtapaRegistro();
      ToastUtils.showCustomToastNotice(
        context,
        'Não foi encontrado um registro de processo para item ou etapa',
      );
      return;
    }
    state.dto?.codRegistroProcesso = result.$2.cod;
    state.dto?.processoRegistro = result.$2;
  }

  void _clearItemEtapaRegistro() {
    state.dto?.codRegistroProcesso = null;
    state.dto?.processoRegistro = null;
    state.dto?.codItem = null;
    state.dto?.item = null;
    state.dto?.codProcessoEtapa = null;
    state.dto?.etapa = null;
  }

  Future changeItem({
    required ItemDropDownSearchResponseDTO? item,
    required BuildContext context,
  }) async {
    if (state.dto == null) return;
    state.dto!.item = item;
    state.dto?.codItem = item?.cod;
    await _changeProcessoRegistro(context: context);
    _change(dto: state.dto!);
  }

  void changeTipoAnormalidade(
    AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
  ) {
    if (state.dto == null) return;
    state.dto!.anormalidadeTipo = anormalidadeTipo;
    state.dto?.codAnormalidadeTipo = anormalidadeTipo?.cod;
    _change(dto: state.dto!);
  }

  Future liberar({
    required BuildContext context,
  }) async {
    (bool, String?)? liberacao = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: AnormalidadeFrmLiberacaoPageWidget(),
      ),
    );
    if (liberacao == null || liberacao.$1 == false || liberacao.$2 == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Observação não informada, liberação cancelada',
      );
      return;
    }

    AnormalidadeSaveDTO? dto = state.dto;
    if (dto == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'Anormalidade não identificada, liberação cancelada, recarregue a página, se o problema continuar, entre em contato com o suporte.',
      );
      return;
    }

    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeLiberarResponseDTO)? result =
        await Modular.get<AnormalidadeService>().liberar(
      AnormalidadeLiberarDTO(
        cod: dto.cod,
        tstamp: dto.tstamp!,
        observacaoLiberacao: liberacao.$2!,
      ),
    );
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    Navigator.of(context).pop(true);
  }
}
