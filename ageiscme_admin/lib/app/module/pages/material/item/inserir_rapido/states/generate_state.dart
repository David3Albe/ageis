import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';

class GenerateState {
  ItemInserirRapidoGerarInserirDTO dto;
  bool loading;

  GenerateState({
    required this.dto,
    this.loading = false,
  });
}
