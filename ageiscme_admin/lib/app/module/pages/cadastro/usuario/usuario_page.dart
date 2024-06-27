import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/cubits/usuario_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/filter/usuario_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm_user_printer/usuario_page_frm_user_printer.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_state.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 80,
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
    load();
    super.initState();
  }

  Future load() async {
    bloc = UsuarioPageCubit(service: UsuarioService());
    await bloc.loadFilter(
      UsuarioFilter(
        tipoQuery: UsuarioFilterTipoQuery.SemFoto,
        carregarFoto: false,
        numeroRegistros: 500,
        ordenarPorAtivosPrimeiro: true,
        ordenarPorCodDecrescente: true,
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsuarioCubitFilter(),
        ),
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const UsuarioButtonFilterWidget(),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  AddButtonWidget(
                    onPressed: () => {
                      openModal(
                        context,
                        UsuarioModel.empty(),
                      ),
                    },
                  ),
                  const Spacer(),
                  CustomPopupMenuWidget(
                    items: [
                      CustomPopupItemModel(
                        text: 'Imprimir Usuários',
                        onTap: imprimirUsuarios,
                      ),
                    ],
                  ),
                ],
              ),
              BlocBuilder<UsuarioPageCubit, UsuarioPageState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  state.usuarios.sort((a, b) => a.cod!.compareTo(b.cod!));
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: PlutoGridWidget(
                        filterOnlyActives: true,
                        orderDescendingFieldColumn: 'cod',
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
            ],
          );
        },
      ),
    );
  }

  Future imprimirUsuarios() async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const UsuarioPageFrmUserPrinterPage();
      },
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
    if (usuario.cod == 0 || usuario.cod == null) {
      usuario.senha = '123456';
    } else {
      usuario.senha = null;
    }

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      theme: Theme.of(context),
      title: 'Cadastro/Edição de Usuários',
      widget: UsuarioPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        usuario: usuario,
      ),
    );
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    UsuarioCubitFilter filterCubit = context.read<UsuarioCubitFilter>();
    ToastUtils.showCustomToastSucess(context, message);
    UsuarioPageCubit userCubit = context.read<UsuarioPageCubit>();
    filterCubit = context.read<UsuarioCubitFilter>();
    UsuarioFilter dto = filterCubit.state;
    await userCubit.loadFilter(dto);
  }

  void delete(BuildContext context, UsuarioModel usuario) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do  Usuário\n${usuario.cod} - ${usuario.nome}',
      onConfirm: () => onConfirmDelete(usuario),
    );
  }

  void onConfirmDelete(UsuarioModel usuario) {
    bloc.delete(context, usuario);
  }
}
