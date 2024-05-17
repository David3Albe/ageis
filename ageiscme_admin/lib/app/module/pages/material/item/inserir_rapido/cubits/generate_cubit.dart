import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/states/generate_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_response_dto.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class GenerateCubit extends Cubit<GenerateState> {
  TextFieldStringWidget? txtEtiqueta;
  TextFieldNumberWidget? txtQuantidade;

  GenerateCubit()
      : super(
          GenerateState(
            dto: ItemInserirRapidoGerarInserirDTO(),
          ),
        );

  void setDTO(ItemInserirRapidoGerarInserirDTO dto) {
    emit(
      GenerateState(
        dto: dto,
      ),
    );
  }

  Future gerarInserir(BuildContext context) async {
    print(state.dto.toJson());
    emit(GenerateState(dto: state.dto, loading: true));
    ItemService itemService = Modular.get<ItemService>();
    (String, ItemInserirRapidoGerarInserirResponseDTO)? result =
        await itemService.inserirRapidoGerarInserir(state.dto);
    if (result == null) {
      emit(GenerateState(dto: state.dto));
      return;
    }
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    searchCubit.addEtiquetas(result.$2.etiquetas, context);
    ToastUtils.showCustomToastSucess(context, result.$1);
    emit(GenerateState(dto: state.dto));
  }

  void setTxtEtiquetaValue(String? idEtiqueta) {
    txtEtiqueta?.text = idEtiqueta ?? '';
  }

  void setTxtQuantidadeValue(int? quantidade) {
    txtQuantidade?.text = quantidade?.toString() ?? '';
  }

  void setTxtEtiqueta(
    TextFieldStringWidget txtEtiqueta,
  ) {
    this.txtEtiqueta = txtEtiqueta;
  }

  void setTxtQuantidade(
    TextFieldNumberWidget txtQuantidade,
  ) {
    this.txtQuantidade = txtQuantidade;
  }
}
