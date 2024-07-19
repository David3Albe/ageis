import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/cubits/epi_entrega_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_frm/epi_entrega_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/filter/epi_entrega_filter_button_widget.dart';
import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_data/services/epi_perfil/epi_perfil_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/epi_perfil/find_by_user/epi_perfil_find_by_user_dto.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_user/epi_perfil_find_by_user_response_dto.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EpiEntregaPage extends StatefulWidget {
  const EpiEntregaPage({this.codUsuario, super.key});
  final int? codUsuario;

  @override
  State<EpiEntregaPage> createState() => _EpiEntregaPageState();
}

class _EpiEntregaPageState extends State<EpiEntregaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Colaborador',
      field: 'colaborador',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final EpiEntregaUsuarioPageCubit bloc =
      EpiEntregaUsuarioPageCubit(service: UsuarioService());

  final EpiDescritorPageCubit blocEpi =
      EpiDescritorPageCubit(service: EpiDescritorService());

  @override
  void initState() {
    UsuarioFilter usuarioFilter = UsuarioFilter(
      numeroRegistros: 500,
      ordenarPorAtivosPrimeiro: true,
      carregarFoto: false,
      tipoQuery: UsuarioFilterTipoQuery.SemFoto,
      apenasAtivos: true,
      apenasColaboradores: true,
      ordenarPorCodDecrescente: true,
    );
    if (widget.codUsuario != null) {
      usuarioFilter.cod = widget.codUsuario;
    }
    Future.wait([
      bloc.filter(usuarioFilter),
      blocEpi.loadEpiDescritor(),
    ]).then((value) {
      if (widget.codUsuario == null) return;
      usuarioFilter.cod = null;
      openModal(
        context,
        bloc.state.usuarios.first,
        bloc.state.usuarios,
        blocEpi.state.episDescritor,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EpiEntregaFilterCubit()),
        BlocProvider.value(value: bloc),
      ],
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RefreshButtonWidget(
                    onPressed: () => refresh(context),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 4)),
                  const EpiEntregaFilterButtonWidget(),
                ],
              ),
              BlocListener<EpiEntregaUsuarioPageCubit,
                  EpiEntregaUsuarioPageState>(
                listener: (context, state) {
                  if (state.error.isNotEmpty) onError(state);
                },
                child:
                    BlocBuilder<EpiDescritorPageCubit, EpiDescritorPageState>(
                  bloc: blocEpi,
                  builder: (context, stateEpi) => BlocBuilder<
                      EpiEntregaUsuarioPageCubit, EpiEntregaUsuarioPageState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state.loading || stateEpi.loading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                          child: PlutoGridWidget(
                            orderDescendingFieldColumn: 'cod',
                            onEdit: (UsuarioModel objeto) => {
                              openModal(
                                context,
                                UsuarioModel.copy(objeto),
                                state.usuarios,
                                stateEpi.episDescritor,
                              ),
                            },
                            columns: colunas,
                            items: state.usuarios,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future refresh(BuildContext context) async {
    EpiEntregaUsuarioPageCubit epiEntregaCubit =
        BlocProvider.of<EpiEntregaUsuarioPageCubit>(context);
    EpiEntregaFilterCubit filterCubit =
        BlocProvider.of<EpiEntregaFilterCubit>(context);
    UsuarioFilter dto = filterCubit.state;
    await epiEntregaCubit.filter(dto);
  }

  Future openModal(
    BuildContext context,
    UsuarioModel? usuario,
    List<UsuarioModel>? usuarios,
    List<EpiDescritorModel>? episDescritores,
  ) async {
    late int chave;
    EpiEntregaModel epiEntrega = EpiEntregaModel(
      cod: 0,
      codDescritorEpi: 0,
      codInstituicao: 0,
      codUsuario: usuario!.cod,
      codUsuarioEntrega: 0,
      conferenciaVisual: false,
      controlarValidade: false,
      dataDescarte: null,
      dataEntrega: null,
      dataLimiteValidade: null,
      ultimaAlteracao: null,
      epiDescritor: null,
      tstamp: '',
    );
    (String, EpiPerfilFindByUserResponseDTO)? episNecessarios =
        await Modular.get<EpiPerfilService>().findByUser(
      EpiPerfilFindByUserDTO(
        codUsuario: usuario.cod!,
      ),
    );
    if (episNecessarios == null) return;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Entrega de Epi',
      widget: EpiEntregaPageFrm(
        episNecessarios: episNecessarios.$2.epis,
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        epiEntrega: epiEntrega,
        usuarios: usuarios!,
        episDescritores: episDescritores!,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void onError(EpiEntregaUsuarioPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
