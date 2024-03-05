import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/processo_sequencia/processo_sequencia_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_item_add_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_link_model.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/model/custom_diagram_rect_model.dart';
import 'package:flutter/material.dart';

class ProcessoTipoFluxoPageController {
  List<CustomDiagramRectModel> _rects = [];
  List<CustomDiagramRectModel> get getRects => _rects;
  List<CustomDiagramItemAddModel> _itemAddable = [];
  List<CustomDiagramItemAddModel> get getItemAddable => _itemAddable;
  Function()? clearMethod;
  final ProcessoTipoModel processoTipo;

  ProcessoTipoFluxoPageController({
    required this.processoTipo,
  });

  void inicializar() {
    carregarRects();
    carregarItensAdicionaveis();
    carregarLinks();
  }

  void carregarLinks() {
    for (CustomDiagramRectModel rect in _rects) {
      rect.links = [];
      adicionarLink(rect);
    }
  }

  void adicionarLink(CustomDiagramRectModel rect) {
    ProcessoEtapaModel? etapa = processoTipo.etapas
        ?.where((element) => element.cod == rect.id)
        .firstOrNull;
    if (etapa == null || etapa.sequencias == null) return;
    for (ProcessoSequenciaModel sequencia in etapa.sequencias!) {
      CustomDiagramRectModel? rectDestiny = _rects
          .where((element) => element.id == sequencia.codEtapaSeguinte)
          .firstOrNull;
      if (rectDestiny == null) continue;
      ProcessoEtapaModel? etapaDestino = processoTipo.etapas
          ?.where((element) => element.cod == rectDestiny.id)
          .firstOrNull;
      if (etapaDestino == null) continue;
      rect.links!.add(
        CustomDiagramLinkModel(
          destiny: rectDestiny,
          originCircle: etapa.exigeLeituraSaida == true,
          originCircleFilled: etapa.conferenciaVisualPermitida == true ||
              etapa.autorizaQuebraFluxo == true,
          midArrow: true,
          destinyCircle: etapaDestino.exigeLeituraEntrada == true,
          destinyCircleFilled:
              etapaDestino.conferenciaVisualPermitida == true ||
                  etapaDestino.autorizaQuebraFluxo == true,
        ),
      );
    }
  }

  void carregarItensAdicionaveis() {
    if (processoTipo.etapas == null) return;
    for (ProcessoEtapaModel etapa in processoTipo.etapas!) {
      if (etapa.nome == null) continue;
      _itemAddable.add(
        CustomDiagramItemAddModel(
          id: etapa.cod!,
          text: etapa.nome!,
        ),
      );
    }
    _itemAddable.sort((a, b) => a.text.compareTo(b.text));
  }

  void carregarRects() {
    if (processoTipo.etapas == null) return;
    for (ProcessoEtapaModel etapa in processoTipo.etapas!) {
      if (etapa.localizacaoX == null || etapa.localizacaoX! < 0) continue;
      _rects.add(
        criarRect(etapa),
      );
    }
  }

  CustomDiagramRectModel criarRect(ProcessoEtapaModel etapa) {
    CustomDiagramRectModel rect = CustomDiagramRectModel(
      id: etapa.cod!,
      width: 70,
      locationX: etapa.localizacaoX!,
      locationY: etapa.localizacaoY ?? 0,
      height: 40,
      text: etapa.nome ?? '',
    );
    switch (etapa.equipamento?.status) {
      case null:
      case EquipamentoModel.STATUS_LIBERADO:
        rect.backColor = Colors.lightGreen;
      case EquipamentoModel.STATUS_LIBERADO_COM_RESTRICOES:
        rect.backColor = Colors.yellow.shade400;
      case EquipamentoModel.STATUS_BLOQUEADO:
        rect.backColor = Colors.red.shade500;
    }
    return rect;
  }

  void clear() {
    if (clearMethod == null) return;
    clearMethod!();
  }

  void save() {
    alteraEtapasNaoInseridasFluxo();
    ajustaEtapasAdicionadas();
  }

  void alteraEtapasNaoInseridasFluxo() {
    for (CustomDiagramItemAddModel itemAdd in _itemAddable) {
      CustomDiagramRectModel? rect =
          _rects.where((element) => element.id == itemAdd.id).firstOrNull;
      if (rect != null) continue;
      ProcessoEtapaModel? etapa = processoTipo.etapas
          ?.where((element) => element.cod == itemAdd.id)
          .firstOrNull;
      if (etapa == null) continue;
      etapa.localizacaoX = -1;
      etapa.localizacaoY = -1;
      etapa.sequencias?.clear();
    }
  }

  void ajustaEtapasAdicionadas() {
    for (CustomDiagramRectModel rect in _rects) {
      ProcessoEtapaModel? etapa = processoTipo.etapas
          ?.where((element) => element.cod == rect.id)
          .firstOrNull;
      if (etapa == null) continue;
      etapa.localizacaoX = rect.locationX;
      etapa.localizacaoY = rect.locationY;
      ajustaSequenciasEtapa(rect, etapa);
    }
  }

  void ajustaSequenciasEtapa(
    CustomDiagramRectModel rect,
    ProcessoEtapaModel etapa,
  ) {
    if (rect.links == null || rect.links?.isNotEmpty != true) return;
    etapa.sequencias = [];
    for (CustomDiagramLinkModel link in rect.links!) {
      etapa.sequencias?.add(
        ProcessoSequenciaModel(
          cod: 0,
          codEtapaProcesso: etapa.cod,
          etapa: null,
          codEtapaSeguinte: link.destiny.id,
          etapaSequinte: null,
          codInstituicao: 0,
          instituicao: null,
          ultimaAlteracao: null,
          tstamp: null,
        ),
      );
    }
  }
}
