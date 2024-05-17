import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/generate_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/readonly_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/states/search_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/search/item_inserir_rapido_search_dto.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/etiqueta/item_inserir_rapido_search_etiqueta_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/item_inserir_rapido_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future load(BuildContext context) async {
    ItemInserirRapidoSearchDTO dto =
        BlocProvider.of<FilterCubit>(context).state.dto;
    emit(SearchState(loading: true));
    (bool, ItemInserirRapidoSearchResponseDTO?) result = await _loadItemZ(
      dto: dto,
      context: context,
    );
    if (result.$1 != true) {
      emit(SearchState(loading: false, response: state.response));
      return null;
    }
    GenerateCubit cubit = BlocProvider.of<GenerateCubit>(context);
    ItemInserirRapidoGerarInserirDTO gerarDTO = cubit.state.dto;
    gerarDTO.quantidade = 1;
    gerarDTO.idEtiquetaBase = dto.idEtiqueta;
    cubit.setTxtQuantidadeValue(1);
    gerarDTO.tamanho = dto.idEtiqueta.length;
    ItemInserirRapidoSearchResponseDTO? response = result.$2;
    if (response == null) {
      gerarDTO.quantidadeMaxima = 999;
      response = _criarInserirRapido(dto: dto);
      gerarDTO.quantidade = 1;
      gerarDTO.quantidadeExistente = 0;
      gerarDTO.quantidadeMaxima = 0;
      ReadonlyCubit readonlyCubiy = BlocProvider.of<ReadonlyCubit>(context);
      readonlyCubiy.setTxtQuantidadeReadonly(true);
      readonlyCubiy.setBotaoGerarVisible(false);
    }
    cubit.setDTO(gerarDTO);
    emit(SearchState(response: response));
  }

  ItemInserirRapidoSearchResponseDTO? _criarInserirRapido({
    required ItemInserirRapidoSearchDTO dto,
  }) {
    return ItemInserirRapidoSearchResponseDTO(
      etiquetas: [],
      idEtiqueta: dto.idEtiqueta,
      qtdeExistente: 0,
      qtdeMax: 0,
    );
  }

  void addEtiquetas(List<String> etiquetas, BuildContext context) {
    state.response?.etiquetas.addAll(
      etiquetas.map(
        (e) => ItemInserirRapidoSearchEtiquetaResponseDTO(idEtiqueta: e),
      ),
    );

    if (state.response?.idEtiqueta?.startsWith('Z') == true) {
      state.response?.qtdeExistente = state.response?.etiquetas.length;
      state.response?.qtdeMax =
          999 - (999 - (state.response?.qtdeExistente ?? 0));
    } else {
      state.response?.qtdeExistente = 0;
      state.response?.qtdeMax = 0;
    }

    GenerateCubit generateCubit = BlocProvider.of<GenerateCubit>(context);
    ItemInserirRapidoGerarInserirDTO dto = generateCubit.state.dto;
    dto.quantidadeExistente = state.response?.qtdeExistente;
    dto.quantidadeMaxima = state.response?.qtdeMax;
    generateCubit.setDTO(dto);
    emit(
      SearchState(
        response: state.response,
        loading: false,
      ),
    );
  }

  Future<(bool, ItemInserirRapidoSearchResponseDTO?)> _loadItemZ({
    required ItemInserirRapidoSearchDTO dto,
    required BuildContext context,
  }) async {
    if (dto.idEtiqueta.startsWith('Z') != true) return (true, null);

    (String, ItemInserirRapidoSearchResponseDTO)? result =
        await Modular.get<ItemService>().inserirRapidoSearch(dto);
    if (result == null) return (false, null);

    ItemInserirRapidoSearchResponseDTO itemZ = result.$2;
    itemZ.idEtiqueta = dto.idEtiqueta;
    itemZ.qtdeExistente = itemZ.etiquetas.length;
    itemZ.qtdeMax = 999 - (999 - (itemZ.qtdeExistente ?? 0));

    ReadonlyCubit readonlyCubiy = BlocProvider.of<ReadonlyCubit>(context);
    GenerateCubit cubit = BlocProvider.of<GenerateCubit>(context);
    ItemInserirRapidoGerarInserirDTO gerarDTO = cubit.state.dto;
    gerarDTO.idEtiqueta = itemZ.idEtiqueta;
    cubit.setTxtEtiquetaValue(itemZ.idEtiqueta);
    gerarDTO.quantidadeExistente = itemZ.qtdeExistente;
    gerarDTO.quantidadeMaxima = itemZ.qtdeMax;
    cubit.setDTO(gerarDTO);
    readonlyCubiy.setTxtEtiquetaReadonly(true);
    readonlyCubiy.setBotaoInserirVisible(false);
    return (true, result.$2);
  }
}
