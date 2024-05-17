import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/states/remove_state.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/registros_expirar/registros_expirar_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/registros/expirar/registros_expirar_search_dto.dart';
import 'package:ageiscme_models/dto/registros/remover/registro/registros_expirar_remover_registro_dto.dart';
import 'package:ageiscme_models/dto/registros/remover/registros_expirar_remover_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/registros/remover/registros_expirar_remover_response_dto.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit() : super(RemoveState());

  Future remove(BuildContext context) async {
    List<RegistrosExpirarSearchResponseDTO>? registrosExpirarRemover =
        BlocProvider.of<SearchCubit>(context)
            .state
            .registros
            ?.where((element) => element.selecionado == true)
            .toList();
    if (registrosExpirarRemover == null || registrosExpirarRemover.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Nenhum registro selecionado para remover',
      );
      return;
    }
    bool confirmarRemocao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção dos registros selecionados?',
    );
    if (!confirmarRemocao) return;
    bool hasRight = await AccessUserService.validateUserHasRight(
      DireitoEnum.PermissaoManutencaoPopup,
    );
    if (!hasRight) {
      ToastUtils.showCustomToastWarning(
        context,
        'Usuário não possui permissão para remover registros',
      );
      return;
    }
    List<RegistrosExpirarRemoverRegistroDTO> registros = registrosExpirarRemover
        .map(
          (e) => RegistrosExpirarRemoverRegistroDTO(
            codTabela: e.codTabela,
            nomeTabela: e.nomeTabela,
          ),
        )
        .toList();

    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    if (auth?.usuario?.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não foi possível identificar o usuário, logue novamente no sistema',
      );
      return;
    }
    RegistrosExpirarService service = Modular.get<RegistrosExpirarService>();
    (String, RegistrosExpirarRemoverResponseDTO)? result =
        await service.remover(
      RegistrosExpirarRemoverDTO(
        codUsuario: auth!.usuario!.cod!,
        registros: registros,
      ),
    );
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    await BlocProvider.of<SearchCubit>(context).search(
      RegistrosExpirarSearchDTO(),
    );
  }
}
