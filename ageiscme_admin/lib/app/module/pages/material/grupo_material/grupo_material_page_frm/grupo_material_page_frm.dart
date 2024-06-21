import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/grupo_material/grupo_material_page_frm/grupo_material_page_frm_state.dart';
import 'package:ageiscme_data/services/grupo_material/grupo_material_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GrupoMaterialPageFrm extends StatefulWidget {
  const GrupoMaterialPageFrm({
    Key? key,
    required this.grupoMaterial,
  }) : super(key: key);

  final GrupoMaterialModel grupoMaterial;

  @override
  State<GrupoMaterialPageFrm> createState() =>
      _GrupoMaterialPageFrmState(grupoMaterial: grupoMaterial);
}

class _GrupoMaterialPageFrmState extends State<GrupoMaterialPageFrm> {
  _GrupoMaterialPageFrmState({required this.grupoMaterial});
  late String titulo;
  GrupoMaterialModel grupoMaterial;
  late final GrupoMaterialPageFrmCubit cubit = GrupoMaterialPageFrmCubit(
    grupoMaterialModel: grupoMaterial,
    service: GrupoMaterialService(),
  );
  late final TextFieldStringWidget txtNomeGrupo = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      grupoMaterial.nome = txtNomeGrupo.text;
    },
  );
  late final TextFieldStringWidget txtDescricaoGrupo = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      grupoMaterial.descricao = txtDescricaoGrupo.text;
    },
  );

  @override
  void initState() {
    txtNomeGrupo.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtDescricaoGrupo.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNomeGrupo.text = grupoMaterial.nome.toString();
    txtDescricaoGrupo.text = grupoMaterial.descricao.toString();
    titulo = 'Cadastro de Grupo de Item';
    if (grupoMaterial.cod != 0) {
      titulo =
          'Edição do Grupo de Item: ${grupoMaterial.cod} - ${grupoMaterial.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<GrupoMaterialPageFrmCubit, GrupoMaterialPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<GrupoMaterialPageFrmCubit, GrupoMaterialPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            constraints: BoxConstraints(
              minWidth: size.width * .5,
              minHeight: size.height * .5,
              maxHeight: size.height * .8,
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: TitleWidget(
                            text: titulo,
                          ),
                        ),
                        const Spacer(),
                        CloseButtonWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, '')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtNomeGrupo,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtDescricaoGrupo,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: grupoMaterial.ativo,
                            onClick: (value) => grupoMaterial.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (grupoMaterial.cod != null && grupoMaterial.cod != 0)
                          CustomPopupMenuWidget(
                            items: [
                              CustomPopupItemHistoryModel.getHistoryItem(
                                child: HistoricoPage(
                                  pk: grupoMaterial.cod!,
                                  termo: 'GRUPO_MATERIAL',
                                ),
                                context: context,
                              ),
                            ],
                          ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: SaveButtonWidget(
                            onPressed: () => {salvar()},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: CleanButtonWidget(
                            onPressed: () => {
                              setState(() {
                                grupoMaterial = GrupoMaterialModel.empty();
                              }),
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: CancelButtonUnfilledWidget(
                            onPressed: () =>
                                {Navigator.of(context).pop((false, ''))},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void salvar() {
    bool nomeValid = txtNomeGrupo.valid;
    bool descricaoValid = txtDescricaoGrupo.valid;
    if (!nomeValid || !descricaoValid) return;
    cubit.save(grupoMaterial);
  }
}
