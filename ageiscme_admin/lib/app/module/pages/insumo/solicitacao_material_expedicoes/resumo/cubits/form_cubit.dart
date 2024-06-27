import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_frm/insumo_movimento_frm_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/form/widgets/ler_usuario/ler_usuario_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/form_state.dart'
    as form;
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/authorize/solicitacao_material_authorize_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/find_one/solicitacao_material_find_one_dto.dart';
import 'package:ageiscme_models/dto/solicitacao_material/receive/solicitacao_material_receive_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/authorize/solicitacao_material_authorize_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/find_one/solicitacao_material_find_one_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/receive/solicitacao_material_receive_response_dto.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class FormCubit extends Cubit<form.FormState> {
  FormCubit() : super(form.FormState());

  bool get botaoAutorizadoReadonly =>
      state.response?.solicitacao?.codUsuarioAutorizacao != null ||
      state.loading == true;

  bool get botaoRecebimentoReadonly {
    if (state.loading == true) return true;
    if (state.response?.solicitacao?.codUsuarioAutorizacao == null ||
        state.response?.solicitacao?.codUsuarioRecebimento != null) {
      return true;
    }
    List<SolicitacaoMaterialItemModel>? itens =
        state.response?.solicitacao?.solicitacoesMateriais;
    if (itens == null ||
        !itens.any((element) => (element.quantidadeEntregue ?? 0) > 0)) {
      return true;
    }
    return false;
  }

  Future carregar(int cod) async {
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
    emit(form.FormState(loading: true));
    (String, SolicitacaoMaterialFindOneResponseDTO)? result =
        await service.findOne(
      SolicitacaoMaterialFindOneDTO(
        cod: cod,
      ),
    );
    if (result == null) return null;
    emit(form.FormState(response: result.$2));
  }

  Future<String?> _getUserBarCode({
    required BuildContext context,
    required String text,
    required String title,
  }) async {
    return await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return LerUsuarioPage(
          text: text,
          title: title,
        );
      },
    );
  }

  Future autorizar(BuildContext context) async {
    SolicitacaoMaterialModel? solicitacao = state.response?.solicitacao;
    if (solicitacao?.cod == null || solicitacao!.cod == 0) return;

    String? userBarCode = await _getUserBarCode(
      context: context,
      text:
          'Identifique-se para autorizar a Solicitação de Material ou Clique em Cancelar.',
      title: 'Autorização da solicitação de material',
    );

    if (userBarCode == null ||
        userBarCode.isEmpty ||
        userBarCode == 'Cancelar') {
      return;
    }

    SolicitacaoMaterialAuthorizeDTO dto = SolicitacaoMaterialAuthorizeDTO(
      cod: solicitacao.cod!,
      codBarraUsuario: userBarCode,
    );

    (String, SolicitacaoMaterialAuthorizeResponseDTO)? response =
        await SolicitacaoMaterialService().authorize(dto);
    if (response == null) return;
    ToastUtils.showCustomToastSucess(context, 'Autorizado');
    await carregar(solicitacao.cod!);
  }

  Future dispensar(
    BuildContext context,
    SolicitacaoMaterialItemModel? item,
  ) async {
    if (item == null) return;
    await openInsumoMovimento(context, item);
  }

  Future openInsumoMovimento(
    BuildContext context,
    SolicitacaoMaterialItemModel item,
  ) async {
    AuthenticationResultDTO? store =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    InsumoMovimentoModel insumoMovimento = InsumoMovimentoModel(
      cod: 0,
      codInsumo: item.codInsumo,
      codBarra: state.response?.insumos[item.codInsumo]?.codBarra ?? null,
      flagEntradaSaida: '2',
      dataHora: DateTime.now(),
      codInstituicao: store!.instituicao!.cod,
      codEquipamentoInsumo: item.codEquipamento,
    );
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Movimentação de Insumo',
      widget: InsumoMovimentoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (p0) => onSaved(p0, context),
        insumoMovimento: insumoMovimento,
        baseSolicitacao: true,
        numeroSolicitacao: state.response?.solicitacao?.cod ?? 0,
        numeroSolicitacaoItem: item.cod,
      ),
    );
  }

  Future onSaved(String str, BuildContext context) async {
    ToastUtils.showCustomToastSucess(context, str);
    await carregar(state.response!.solicitacao!.cod!);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  Future receber(BuildContext context) async {
    SolicitacaoMaterialModel? solicitacao = state.response?.solicitacao;
    if (solicitacao?.cod == null || solicitacao!.cod == 0) return;

    String? userBarCode = await _getUserBarCode(
      context: context,
      text:
          'Confirme atentamento a movimentação preenchida\nFaça a leitura do Usuário que está retirando os materiais ou Clique em Cancelar.',
      title: 'Recebimento dos materiais',
    );

    if (userBarCode == null ||
        userBarCode.isEmpty ||
        userBarCode == 'Cancelar') {
      return;
    }

    AuthenticationStore store = Modular.get<AuthenticationStore>();
    AuthenticationResultDTO? result = await store.GetAuthenticated();

    if (result?.usuario?.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não foi possível definir o usuário no sistema, entre novamente para realizar o recebimento',
      );
      return;
    }

    SolicitacaoMaterialReceiveDTO dto = SolicitacaoMaterialReceiveDTO(
      cod: solicitacao.cod!,
      codBarraUsuarioRecebedor: userBarCode,
      codUsuarioEntrega: result!.usuario!.cod!,
    );

    (String, SolicitacaoMaterialReceiveResponseDTO)? response =
        await SolicitacaoMaterialService().receive(dto);
    if (response == null) return;
    ToastUtils.showCustomToastSucess(context, 'Recebimento concluído');
    await carregar(solicitacao.cod!);
  }
}
