import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_state.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Login', field: 'login'),
    CustomDataColumn(
      text: 'RG',
      field: 'rg',
      valueConverter: (value) => value == 0 ? '' : value,
    ),
    CustomDataColumn(text: 'Cod. Barra', field: 'codBarra'),
    CustomDataColumn(text: 'Nome Empresa', field: 'nomeEmpresa'),
    CustomDataColumn(text: 'Doc. Classe', field: 'docClasse'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final UsuarioPageCubit bloc;

  @override
  void initState() {
    bloc = UsuarioPageCubit(service: UsuarioService());
    bloc.loadUsuario();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              UsuarioModel.empty(),
            ),
          },
        ),
        BlocListener<UsuarioPageCubit, UsuarioPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
          },
          child: BlocBuilder<UsuarioPageCubit, UsuarioPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    filterOnlyActives: true,
                    onEdit: (UsuarioModel objeto) =>
                        {openModal(context, UsuarioModel.copy(objeto))},
                    onDelete: (UsuarioModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.usuarios,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<UsuarioModel?> GetUser(UsuarioModel usuario) async =>
      await UsuarioService().FilterOne(
        UsuarioFilter(
          cod: usuario.cod,
          tStamp: usuario.tstamp,
          incluirDireitos: true,
          carregarFoto: true,
          tipoQuery: UsuarioFilterTipoQuery.SemFoto,
        ),
      );

  Future<bool> loadFullData(UsuarioModel usuario) async {
    if (usuario.cod == 0) return true;
    LoadingController loading = LoadingController(context: context);
    UsuarioModel? usuarioEncontrado = await GetUser(usuario);

    if (usuarioEncontrado == null) {
      loading.close(context, mounted);
      notFoundError(context);
      return false;
    }
    usuario.foto = usuarioEncontrado.foto;
    usuario.usuariosPerfis = usuarioEncontrado.usuariosPerfis;
    loading.close(context, mounted);
    return true;
  }

  void notFoundError(BuildContext context) {
    ErrorUtils.showErrorDialog(context, [
      'O Usuário que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }

  void openModal(BuildContext context, UsuarioModel usuario) async {
    bool fullDataLoaded = await loadFullData(usuario);
    if (!fullDataLoaded) return;

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return UsuarioPageFrm(
          usuario: usuario,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadUsuario();
  }

  void delete(BuildContext context, UsuarioModel usuario) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do  Usuário\n${usuario.cod} - ${usuario.nome}',
    );
    if (confirmacao) bloc.delete(usuario);
  }

  void deleted(UsuarioPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadUsuario();
  }
}
