import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/search_state.dart';
import 'package:ageiscme_data/services/historico/historico_service.dart';
import 'package:ageiscme_models/dto/historico/search/historico_search_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/historico_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future search(BuildContext context) async {
    HistoricoSearchDTO dto = BlocProvider.of<FilterCubit>(context).state.dto;
    emit(SearchState(loading: true));
    HistoricoService service = Modular.get<HistoricoService>();
    (String, HistoricoSearchResponseDTO)? response = await service.search(dto);
    if (response == null) return;
    emit(SearchState(loading: false, response: response.$2));
  }
}
