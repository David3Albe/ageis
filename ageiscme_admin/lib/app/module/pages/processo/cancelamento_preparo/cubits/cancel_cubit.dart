import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/selected_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/cancel_state.dart';
import 'package:ageiscme_data/services/processo_leitura_cancelamento_preparo/processo_leitura_cancelamento_preparo_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_cancelamento_preparo/cancel/processo_leitura_cancelamento_preparo_cancel_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/cancel/processo_leitura_cancelamento_preparo_cancel_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class CancelCubit extends Cubit<CancelState> {
  CancelCubit() : super(CancelState());

  Future cancel(BuildContext context) async {
      bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma o cancelamento das leituras?',
    );
    if (!confirmacao) return;

    emit(CancelState());
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>? leituras =
        searchCubit.state.response?.leituras;


    LoadingController loading = LoadingController(context: context);
    if (leituras == null || leituras.isEmpty) {
      loading.closeDefault();
      return;
    }
    List<int> codigos = [];
    for (ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO leitura
        in leituras) {
      codigos.add(leitura.codProcessoLeitura);
    }
    AuthenticationResultDTO? result =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    ProcessoLeituraCancelamentoPreparoCancelDTO dto =
        ProcessoLeituraCancelamentoPreparoCancelDTO(
      codigos: codigos,
      codUsuarioCancelamento: result!.usuario!.cod!,
    );
    ProcessoLeituraCancelamentoPreparoService service =
        Modular.get<ProcessoLeituraCancelamentoPreparoService>();
    (String, ProcessoLeituraCancelamentoPreparoCancelResponseDTO)? response =
        await service.cancel(dto);
    loading.closeDefault();
    if (response == null) return;
    SelectedCubit selectedCubit = BlocProvider.of<SelectedCubit>(context);
    emit(CancelState(response: response.$2));
    searchCubit.clear();
    selectedCubit.clear();
    ToastUtils.showCustomToastSucess(context, response.$1);
  }
}
