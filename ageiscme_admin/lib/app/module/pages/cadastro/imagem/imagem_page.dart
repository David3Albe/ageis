import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page_frm/imagem_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page_state.dart';
import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_models/filters/imagem/imagem_filter.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
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

class ImagemPage extends StatefulWidget {
  const ImagemPage({super.key});

  @override
  State<ImagemPage> createState() => _ImagemPageState();
}

class _ImagemPageState extends State<ImagemPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Idendificator', field: 'identificadorImagem'),
    CustomDataColumn(text: 'Imagem', field: 'nomeFoto'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final ImagemPageCubit bloc;
  late final ImagemService service;

  @override
  void initState() {
    service = ImagemService();
    bloc = ImagemPageCubit(service: service);
    bloc.loadImagem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: bloc.loadImagem,
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            AddButtonWidget(
              onPressed: () async => {
                await openModal(
                  context,
                  ImagemModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<ImagemPageCubit, ImagemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ImagemPageCubit, ImagemPageState>(
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
                    orderDescendingFieldColumn: 'cod',
                    onEdit: (ImagemModel objeto) => {
                      openModal(
                        context,
                        ImagemModel.copy(objeto),
                      ),
                    },
                    onDelete: (ImagemModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.imagens,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<ImagemModel?> getFilter(
    ImagemModel imagem,
  ) async {
    return service.FilterOne(
      ImagemFilter(
        cod: imagem.cod,
      ),
    );
  }

  Future openModal(BuildContext context, ImagemModel imagem) async {
    LoadingController loading = LoadingController(context: context);

    ImagemModel? imagemModel = imagem;
    if (imagem.cod != 0) {
      imagemModel = await getFilter(
        imagem,
      );
      if (imagemModel == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Imagem',
      widget: ImagemPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        imagem: imagemModel,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadImagem();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ImagemModel imagem) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Imagem\n${imagem.cod} - ${imagem.nomeFoto}',
      onConfirm: () => onConfirmDelete(imagem),
    );
  }

  void onConfirmDelete(ImagemModel obj) {
    bloc.delete(obj);
  }

  void deleted(ImagemPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadImagem();
  }

  void onError(ImagemPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro da Imagem que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
