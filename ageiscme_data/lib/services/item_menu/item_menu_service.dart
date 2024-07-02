import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ItemMenuService {
  List<ItemMenuModel> getItems(
    Set<int> direitosUsuario, {
    bool ignorarDireitos = false,
  }) {
    final List<ItemMenuModel> itens = [];
    _criarItemsCadastro(itens, direitosUsuario, ignorarDireitos);
    _criarItensColaborador(itens, direitosUsuario, ignorarDireitos);
    _criarItensInsumo(itens, direitosUsuario, ignorarDireitos);
    _criarItensEquipamento(itens, direitosUsuario, ignorarDireitos);
    _criarItensProcesso(itens, direitosUsuario, ignorarDireitos);
    _criarItensMaterial(itens, direitosUsuario, ignorarDireitos);
    _criarItensArsenal(itens, direitosUsuario, ignorarDireitos);
    _criarItensBiblioteca(itens, direitosUsuario, ignorarDireitos);
    return itens;
  }

  Future<List<ItemMenuModel>> getItemsLiberados() async {
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    if (authentication == null) return [];
    Set<int> direitos = {};

    for (UsuarioPerfilModel perfil in authentication.usuario!.usuariosPerfis!) {
      direitos.addAll(perfil.direitos?.map((e) => e.codDireito!) ?? []);
    }
    List<ItemMenuModel> itens = getItems(direitos);
    return itens;
  }

  void _criarItemsCadastro(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemCadastros = ItemMenuModel('Cadastros');
    menuItemCadastros.icon = const Icon(Symbols.edit_square);

    if (direitosUsuario.contains(DireitoEnum.UsuariosAlterarSenha) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Alterar Senha',
          route: '/cadastro/alterar-senha',
          rights: [
            DireitoEnum.UsuariosAlterarSenha,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.PerfisConsulta) ||
        direitosUsuario.contains(DireitoEnum.PerfisManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Perfis de Acesso',
          route: '/cadastro/perfil-acesso',
          rights: [
            DireitoEnum.PerfisConsulta,
            DireitoEnum.PerfisManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.UsuariosConsulta) ||
        direitosUsuario.contains(DireitoEnum.UsuariosManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Usuários',
          route: '/cadastro/usuario',
          rights: [
            DireitoEnum.UsuariosConsulta,
            DireitoEnum.UsuariosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ParametrosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ParametrosManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Parametros',
          route: '/cadastro/parametro-sistema',
          rights: [
            DireitoEnum.ParametrosConsulta,
            DireitoEnum.ParametrosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InstituicoesConsulta) ||
        direitosUsuario.contains(DireitoEnum.InstituicoesManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Instituições',
          route: '/cadastro/instituicao',
          rights: [
            DireitoEnum.InstituicoesConsulta,
            DireitoEnum.InstituicoesManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.CentroCustoConsulta) ||
        direitosUsuario.contains(DireitoEnum.CentroCustoManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Centros De Custo',
          route: '/cadastro/centro-custo',
          rights: [
            DireitoEnum.CentroCustoConsulta,
            DireitoEnum.CentroCustoManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.LocaisConsulta) ||
        direitosUsuario.contains(DireitoEnum.LocaisManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Locais das Instituições',
          route: '/cadastro/local-instituicao',
          rights: [
            DireitoEnum.LocaisConsulta,
            DireitoEnum.LocaisManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ProprietariosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ProprietarioManutencao) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Proprietários',
          route: '/cadastro/proprietario',
          rights: [
            DireitoEnum.ProprietariosConsulta,
            DireitoEnum.ProprietarioManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.DocumentosCadastro) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Tipo Documento',
          route: '/cadastro/tipo-documento',
          rights: [DireitoEnum.DocumentosCadastro],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ImagemManutencao) ||
        direitosUsuario.contains(DireitoEnum.ImagemConsulta) ||
        ignorarDireitos) {
      menuItemCadastros.addChildren(
        ItemMenuModel(
          'Imagens',
          route: '/cadastro/imagem',
          rights: [
            DireitoEnum.ImagemConsulta,
            DireitoEnum.ImagemManutencao,
          ],
        ),
      );
    }

    if (menuItemCadastros.getChildrens().isNotEmpty) {
      itens.add(menuItemCadastros);
    }
  }

  void _criarItensColaborador(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemColaborador = ItemMenuModel('Colaboradores');
    menuItemColaborador.icon = const Icon(
      Symbols.group,
    );

    if (direitosUsuario.contains(DireitoEnum.SiglasConsulta) ||
        direitosUsuario.contains(DireitoEnum.SiglasManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Siglas',
          route: '/colaborador/sigla',
          rights: [
            DireitoEnum.SiglasConsulta,
            DireitoEnum.SiglasManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.TurnosConsulta) ||
        direitosUsuario.contains(DireitoEnum.TurnosManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Turnos',
          route: '/colaborador/turno',
          rights: [
            DireitoEnum.TurnosConsulta,
            DireitoEnum.TurnosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EscalasConsulta) ||
        direitosUsuario.contains(DireitoEnum.EscalasManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Escala',
          route: '/colaborador/escala',
          rights: [
            DireitoEnum.EscalasConsulta,
            DireitoEnum.EscalasManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ASOsUsuariosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ASOsUsuariosManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Atest. Saúde Ocupacional',
          route: '/colaborador/atestado-saude-ocupacional',
          rights: [
            DireitoEnum.ASOsUsuariosConsulta,
            DireitoEnum.ASOsUsuariosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AfastamentosConsulta) ||
        direitosUsuario.contains(DireitoEnum.AfastamentosManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Registro de Afastamento',
          route: '/colaborador/afastamento',
          rights: [
            DireitoEnum.AfastamentosConsulta,
            DireitoEnum.AfastamentosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.TreinamentosRegistrosConsulta) ||
        direitosUsuario.contains(DireitoEnum.TreinamentosRegistrosManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Registros de Treinamentos',
          route: '/colaborador/treinamento-registro',
          rights: [
            DireitoEnum.TreinamentosRegistrosConsulta,
            DireitoEnum.TreinamentosRegistrosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EPIsUsuariosConsulta) ||
        direitosUsuario.contains(DireitoEnum.EPIsUsuariosManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Registros de Entrega de EPI\'s',
          route: '/colaborador/epi-entrega',
          rights: [
            DireitoEnum.EPIsUsuariosConsulta,
            DireitoEnum.EPIsUsuariosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EPIsDescritorConsulta) ||
        direitosUsuario.contains(DireitoEnum.EPIsDescritorManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Descritor de EPI\'s',
          route: '/colaborador/epi-descritor',
          rights: [
            DireitoEnum.EPIsDescritorConsulta,
            DireitoEnum.EPIsDescritorManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AfastamentosTiposConsulta) ||
        direitosUsuario.contains(DireitoEnum.AfastamentosTiposManutencao) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Tipos de Afastamentos',
          route: '/colaborador/tipo-afastamento',
          rights: [
            DireitoEnum.AfastamentosTiposConsulta,
            DireitoEnum.AfastamentosTiposManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.HistoricoColaboradoresConsulta) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Histórico dos Colaboradores',
          route: '/colaborador/consulta-historico-colaborador',
          rights: [
            DireitoEnum.HistoricoColaboradoresConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AfastamentosConsulta) ||
        ignorarDireitos) {
      menuItemColaborador.addChildren(
        ItemMenuModel(
          'Consulta Utilização EPC / EPI',
          route: '/colaborador/consulta-processo-resposta-ecp-epi',
          rights: [
            DireitoEnum.ProcessoRespostaEPCEPI,
          ],
        ),
      );
    }

    if (menuItemColaborador.getChildrens().isNotEmpty) {
      itens.add(menuItemColaborador);
    }
  }

  void _criarItensInsumo(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemInsumo = ItemMenuModel('Insumos');
    menuItemInsumo.icon = const Icon(
      Symbols.medical_services,
      fill: 0,
    );

    if (direitosUsuario.contains(DireitoEnum.InsumosConsulta) ||
        direitosUsuario.contains(DireitoEnum.InsumosManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Cad. de Insumos',
          route: '/insumo/insumo',
          rights: [
            DireitoEnum.InsumosConsulta,
            DireitoEnum.InsumosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosDepositoConsulta) ||
        direitosUsuario.contains(DireitoEnum.InsumosDepositoManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Depósitos',
          route: '/insumo/deposito',
          rights: [
            DireitoEnum.InsumosDepositoConsulta,
            DireitoEnum.InsumosDepositoManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosDepositoConsulta) ||
        direitosUsuario.contains(DireitoEnum.InsumosDepositoManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Movimentação',
          route: '/insumo/insumo-movimento',
          rights: [
            DireitoEnum.InsumosMovimentosConsulta,
            DireitoEnum.InsumosMovimentosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosDepositoConsulta) ||
        direitosUsuario.contains(DireitoEnum.InsumosDepositoManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Teste de Qualidade',
          route: '/insumo/insumo-teste',
          rights: [
            DireitoEnum.InsumosTestesConsulta,
            DireitoEnum.InsumosTestesManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosDepositoConsulta) ||
        direitosUsuario.contains(DireitoEnum.InsumosDepositoManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Destino de Resíduos',
          route: '/insumo/destino-residuo',
          rights: [
            DireitoEnum.InsumosDepositoConsulta,
            DireitoEnum.InsumosDepositoManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosSaldosConsulta) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Saldos',
          route: '/insumo/consulta-insumo-saldo',
          rights: [
            DireitoEnum.InsumosSaldosConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosSaldosConsulta) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Consulta Movimentação',
          route: '/insumo/consulta-movimento-estoque',
          rights: [
            DireitoEnum.InsumosSaldosConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosSaldosConsulta) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Posição do Estoque',
          route: '/insumo/consulta-insumo-estoque',
          rights: [
            DireitoEnum.InsumosSaldosConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.InsumosSolicitacaoMaterial) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Solicitação de Material',
          route: '/insumo/solicitacao-material',
          rights: [
            DireitoEnum.InsumosSolicitacaoMaterial,
          ],
        ),
      );
    }

    if (direitosUsuario
            .contains(DireitoEnum.InsumosSolicitacaoMaterialExpedicoes) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Solicitação de Material Expedições',
          route: '/insumo/solicitacao-material-expedicoes',
          rights: [
            DireitoEnum.InsumosSolicitacaoMaterialExpedicoes,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.UnidadesMedidasConsulta) ||
        direitosUsuario.contains(DireitoEnum.UnidadesMedidasManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Unidade de Medidas',
          route: '/material/unidade-medida',
          rights: [
            DireitoEnum.UnidadesMedidasConsulta,
            DireitoEnum.UnidadesMedidasManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.FabricantesConsulta) ||
        direitosUsuario.contains(DireitoEnum.FabricantesManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Fabricantes',
          route: '/insumo/fabricante',
          rights: [
            DireitoEnum.FabricantesConsulta,
            DireitoEnum.FabricantesManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.FornecedorConsulta) ||
        direitosUsuario.contains(DireitoEnum.FornecedorManutencao) ||
        ignorarDireitos) {
      menuItemInsumo.addChildren(
        ItemMenuModel(
          'Fornecedores',
          route: '/insumo/fornecedor',
          rights: [
            DireitoEnum.FornecedorConsulta,
            DireitoEnum.FornecedorManutencao,
          ],
        ),
      );
    }

    if (menuItemInsumo.getChildrens().isNotEmpty) {
      itens.add(menuItemInsumo);
    }
  }

  void _criarItensEquipamento(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemEquipamento = ItemMenuModel('Equipamentos');
    menuItemEquipamento.icon = const Icon(Symbols.ecg);

    if (direitosUsuario.contains(DireitoEnum.EquipamentosConsulta) ||
        direitosUsuario.contains(DireitoEnum.EquipamentosManutencao) ||
        ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Cad. de Equipamentos',
          route: '/equipamento/equipamento',
          rights: [
            DireitoEnum.EquipamentosConsulta,
            DireitoEnum.EquipamentosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ServicosRegistrosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ServicosRegistrosManutencao) ||
        direitosUsuario.contains(DireitoEnum.MonitoramentoConsultaNoCadastro) ||
        ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Monitoramento',
          route: '/equipamento/registro-servico',
          rights: [
            DireitoEnum.ServicosRegistrosConsulta,
            DireitoEnum.ServicosRegistrosManutencao,
            DireitoEnum.MonitoramentoConsultaNoCadastro,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ServicosTiposConsulta) ||
        direitosUsuario.contains(DireitoEnum.ServicosTiposManutencao) ||
        ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Tipos de Serviços',
          route: '/equipamento/servico-tipo',
          rights: [
            DireitoEnum.ServicosTiposConsulta,
            DireitoEnum.ServicosTiposManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ServicosRegistrosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ServicosRegistrosManutencao) ||
        ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Consulta Monitoramento',
          route: '/equipamento/consulta-registro-servico',
          rights: [
            DireitoEnum.ServicosRegistrosConsulta,
            DireitoEnum.ServicosRegistrosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.CadastroPecasManutencao) ||
        direitosUsuario.contains(DireitoEnum.PecasConsulta) ||
        ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Peças',
          route: '/equipamento/peca',
          rights: [
            DireitoEnum.CadastroPecasManutencao,
            DireitoEnum.PecasConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.Manutencao) || ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Manutenção',
          route: '/equipamento/equipamento-manutencao',
          rights: [
            DireitoEnum.Manutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.Manutencao) || ignorarDireitos) {
      menuItemEquipamento.addChildren(
        ItemMenuModel(
          'Manutenção Consulta',
          route: '/equipamento/consulta-manutencao',
          rights: [
            DireitoEnum.Manutencao,
          ],
        ),
      );
    }
    if (menuItemEquipamento.getChildrens().isNotEmpty) {
      itens.add(menuItemEquipamento);
    }
  }

  void _criarItensProcesso(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemProcesso = ItemMenuModel('Processo');
    menuItemProcesso.icon = const Icon(Symbols.cycle);

    if (direitosUsuario.contains(DireitoEnum.ProcessosTipoConsulta) ||
        direitosUsuario.contains(DireitoEnum.ProcessosTipoManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Tipos Processo',
          route: '/processo/processo-tipo',
          rights: [
            DireitoEnum.ProcessosTipoConsulta,
            DireitoEnum.ProcessosTipoManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ProcessosEtapasConsulta) ||
        direitosUsuario.contains(DireitoEnum.ProcessosEtapasManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Etapas Processo',
          route: '/processo/processo-etapa',
          rights: [
            DireitoEnum.ProcessosEtapasConsulta,
            DireitoEnum.ProcessosEtapasManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ManutencaoLiberacaoLeituras) ||
        direitosUsuario.contains(DireitoEnum.ConsultaLiberacaoLeituras) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Liberação Leituras',
          route: '/processo/liberacao-leituras',
          rights: [
            DireitoEnum.ManutencaoLiberacaoLeituras,
            DireitoEnum.ConsultaLiberacaoLeituras,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.MotivosConsulta) ||
        direitosUsuario.contains(DireitoEnum.MotivosManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Motivos de Processo',
          route: '/processo/processo-motivo',
          rights: [
            DireitoEnum.MotivosConsulta,
            DireitoEnum.MotivosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.MotivosConsulta) ||
        direitosUsuario.contains(DireitoEnum.MotivosManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Motivos de Quebra de Fluxo',
          route: '/processo/motivo-quebra-fluxo',
          rights: [
            DireitoEnum.MotivosConsulta,
            DireitoEnum.MotivosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AnormalidadesTiposConsulta) ||
        direitosUsuario.contains(DireitoEnum.AnormalidadesTiposManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Tipos de Anormalidade',
          route: '/processo/anormalidade-tipo',
          rights: [
            DireitoEnum.AnormalidadesTiposConsulta,
            DireitoEnum.AnormalidadesTiposManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AnormalidadesRegistrosConsulta) ||
        direitosUsuario
            .contains(DireitoEnum.AnormalidadesRegistrosManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Registros de Anormalidade',
          route: '/processo/anormalidade',
          rights: [
            DireitoEnum.AnormalidadesRegistrosConsulta,
            DireitoEnum.AnormalidadesRegistrosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AnormalidadesRegistrosConsulta) ||
        direitosUsuario
            .contains(DireitoEnum.AnormalidadesRegistrosManutencao) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta de Anormalidades',
          route: '/processo/consulta-anormalidade',
          rights: [
            DireitoEnum.AnormalidadesRegistrosConsulta,
            DireitoEnum.AnormalidadesRegistrosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta Registros de Processo',
          route: '/processo/consulta-processo-leitura',
          rights: [
            DireitoEnum.ProcessoLeituraConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta Consignados Processados',
          route: '/processo/consulta-processo-consignado',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ProcessosEtapasConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta Fluxo Processo',
          route: '/processo/processo-tipo-consulta',
          rights: [
            DireitoEnum.ProcessosEtapasConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AcoesOcorrencias) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Ações para Ocorrências',
          route: '/processo/acao-ocorrencia',
          rights: [
            DireitoEnum.AcoesOcorrencias,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.AcoesOcorrenciasConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta das Ações para Ocorrências',
          route: '/processo/consulta-processo-leitura-acao-ocorrencia',
          rights: [
            DireitoEnum.AcoesOcorrenciasConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ProcessoLeituraConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Cancelamento de Etapa de Preparo',
          route: '/processo/cancelamento-preparo',
          rights: [
            DireitoEnum.ProcessoLeituraCancelamentoEtapa,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ProcessoLeituraConsulta) ||
        ignorarDireitos) {
      menuItemProcesso.addChildren(
        ItemMenuModel(
          'Consulta Entrada Automática - Cancelamentos',
          route: '/processo/consulta-processo-leitura-entrada-automatica',
          rights: [
            DireitoEnum.ProcessoLeituraConsulta,
          ],
        ),
      );
    }

    if (menuItemProcesso.getChildrens().isNotEmpty) {
      itens.add(menuItemProcesso);
    }
  }

  void _criarItensMaterial(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemMateriais = ItemMenuModel('Materiais');
    menuItemMateriais.icon = const Icon(Symbols.construction);

    if (direitosUsuario.contains(DireitoEnum.ItensGruposConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensGruposManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Grupos de Materiais',
          route: '/material/grupo-material',
          rights: [
            DireitoEnum.ItensGruposConsulta,
            DireitoEnum.ItensGruposManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EnbalagensConsulta) ||
        direitosUsuario.contains(DireitoEnum.EnbalagensManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Embalagens',
          route: '/material/embalagem',
          rights: [
            DireitoEnum.EnbalagensConsulta,
            DireitoEnum.EnbalagensManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.TamanhosConsulta) ||
        direitosUsuario.contains(DireitoEnum.TamanhosManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Tamanhos',
          route: '/material/tamanho',
          rights: [
            DireitoEnum.TamanhosConsulta,
            DireitoEnum.TamanhosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.KitsDescritorConsulta) ||
        direitosUsuario.contains(DireitoEnum.KitsDescritorManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Descritor de Kits',
          route: '/material/kit-descritor',
          rights: [
            DireitoEnum.KitsDescritorConsulta,
            DireitoEnum.KitsDescritorManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.KitsCoresConsulta) ||
        direitosUsuario.contains(DireitoEnum.KitsCoresManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Cores dos Kits',
          route: '/material/kit-cor',
          rights: [
            DireitoEnum.KitsCoresConsulta,
            DireitoEnum.KitsCoresManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.KitsConsulta) ||
        direitosUsuario.contains(DireitoEnum.KitsManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Cadastro de Kits',
          route: '/material/kit',
          rights: [
            DireitoEnum.KitsConsulta,
            DireitoEnum.KitsManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.KitsConsulta) ||
        direitosUsuario.contains(DireitoEnum.KitsManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Consulta Kits',
          route: '/material/consulta-kit',
          rights: [
            DireitoEnum.KitsConsulta,
            DireitoEnum.KitsManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.KitsConsulta) ||
        direitosUsuario.contains(DireitoEnum.KitsManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Inventário de Kits',
          route: '/material/consulta-kit-inventario',
          rights: [
            DireitoEnum.KitsConsulta,
            DireitoEnum.KitsManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensDescritorConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensDescritorManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Descritor de Itens',
          route: '/material/item-descritor',
          rights: [
            DireitoEnum.ItensDescritorConsulta,
            DireitoEnum.ItensDescritorManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Cadastro de Itens',
          route: '/material/item',
          rights: [
            DireitoEnum.ItensConsulta,
            DireitoEnum.ItensManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensConsignadosConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensConsignadosManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Cadastro de Itens Consignados',
          route: '/material/item-consignado',
          rights: [
            DireitoEnum.ItensConsignadosConsulta,
            DireitoEnum.ItensConsignadosManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Consulta Itens',
          route: '/material/consulta-item',
          rights: [
            DireitoEnum.ItensConsulta,
            DireitoEnum.ItensManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Inventário de Itens',
          route: '/material/consulta-item-inventario',
          rights: [
            DireitoEnum.ItensConsulta,
            DireitoEnum.ItensManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EtiquetasConsulta) ||
        direitosUsuario.contains(DireitoEnum.EtiquetasManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Cadastro de Etiquetas',
          route: '/material/etiqueta',
          rights: [
            DireitoEnum.EtiquetasConsulta,
            DireitoEnum.EtiquetasManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ItensConsulta) ||
        direitosUsuario.contains(DireitoEnum.ItensManutencao) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Etiquetas DataMatrix',
          route: '/material/consulta-item-etiqueta',
          rights: [
            DireitoEnum.ItensConsulta,
            DireitoEnum.ItensManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario
            .contains(DireitoEnum.ManutencaoMotivoReporRemoverItens) ||
        direitosUsuario.contains(DireitoEnum.ConsultaMotivoReporRemoverItens) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Motivos Remover / Repor Itens',
          route: '/material/motivo-remover-repor-item',
          rights: [
            DireitoEnum.ManutencaoMotivoReporRemoverItens,
            DireitoEnum.ConsultaMotivoReporRemoverItens,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.ConsultaReporRemoverItem) ||
        direitosUsuario.contains(DireitoEnum.ManutencaoReporRemoverItem) ||
        ignorarDireitos) {
      menuItemMateriais.addChildren(
        ItemMenuModel(
          'Consulta Remover / Repor Itens',
          route: '/material/consulta-remover-repor-item',
          rights: [
            DireitoEnum.ConsultaReporRemoverItem,
            DireitoEnum.ManutencaoReporRemoverItem,
          ],
        ),
      );
    }

    if (menuItemMateriais.getChildrens().isNotEmpty) {
      itens.add(menuItemMateriais);
    }
  }

  void _criarItensArsenal(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemArsenal = ItemMenuModel('Arsenal');
    menuItemArsenal.icon = const Icon(Symbols.home_health);

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        direitosUsuario.contains(DireitoEnum.EstoquesManutencao) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Cad. de Arsenais',
          route: '/arsenal/arsenal',
          rights: [
            DireitoEnum.EstoquesConsulta,
            DireitoEnum.EstoquesManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesLocaisConsulta) ||
        direitosUsuario.contains(DireitoEnum.EstoquesLocaisManutencao) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Localizações',
          route: '/arsenal/localizacao-arsenal',
          rights: [
            DireitoEnum.EstoquesLocaisConsulta,
            DireitoEnum.EstoquesLocaisManutencao,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Vencidos',
          route: '/arsenal/consulta-estoque-vencido',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Retirados',
          route: '/arsenal/consulta-processos-leitura-retirado',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Retirados com Diverg. Local',
          route: '/arsenal/consulta-processos-leitura-retirado-div-local',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Retirados por Tamanho',
          route: '/arsenal/consulta-processos-leitura-tamanho',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Devolvidos',
          route: '/arsenal/consulta-processo-leitura-devolvido',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Disponíveis',
          route: '/arsenal/consulta-estoque-disponivel',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Dispensado',
          route: '/arsenal/consulta-processos-leitura-dispensado',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.EstoquesConsulta) ||
        ignorarDireitos) {
      menuItemArsenal.addChildren(
        ItemMenuModel(
          'Disponíveis Rotulado',
          route: '/arsenal/consulta-estoque-disponivel-rotulado',
          rights: [
            DireitoEnum.EstoquesConsulta,
          ],
        ),
      );
    }

    if (menuItemArsenal.getChildrens().isNotEmpty) {
      itens.add(menuItemArsenal);
    }
  }

  void _criarItensBiblioteca(
    List<ItemMenuModel> itens,
    Set<int> direitosUsuario,
    bool ignorarDireitos,
  ) {
    final ItemMenuModel menuItemDocumento = ItemMenuModel('Biblioteca');
    menuItemDocumento.icon = const Icon(Symbols.library_books);

    if (direitosUsuario.contains(DireitoEnum.GestaoContratoCadastro) ||
        direitosUsuario.contains(DireitoEnum.GestaoContratoConsulta) ||
        ignorarDireitos) {
      menuItemDocumento.addChildren(
        ItemMenuModel(
          'Gestão de Documentos',
          route: '/biblioteca/gestao-contrato',
          rights: [
            DireitoEnum.GestaoContratoCadastro,
            DireitoEnum.GestaoContratoConsulta,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.DocumentosCadastro) ||
        ignorarDireitos) {
      menuItemDocumento.addChildren(
        ItemMenuModel(
          'Cadastro de Documentos',
          route: '/biblioteca/documento',
          rights: [
            DireitoEnum.DocumentosCadastro,
          ],
        ),
      );
    }

    if (direitosUsuario.contains(DireitoEnum.DocumentosConsulta) ||
        ignorarDireitos) {
      menuItemDocumento.addChildren(
        ItemMenuModel(
          'Consulta de Documentos',
          route: '/biblioteca/consulta-documento',
          rights: [
            DireitoEnum.DocumentosConsulta,
          ],
        ),
      );
    }

    if (menuItemDocumento.getChildrens().isNotEmpty) {
      itens.add(menuItemDocumento);
    }
  }
}
