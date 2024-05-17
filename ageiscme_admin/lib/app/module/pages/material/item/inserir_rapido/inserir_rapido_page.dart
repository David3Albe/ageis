import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/generate_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/readonly_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/inserir_rapido_widget.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/search/item_inserir_rapido_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InserirRapidoPage extends StatelessWidget {
  const InserirRapidoPage({
    required this.item,
    Key? key,
  }) : super(key: key);

  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Inserir Rápido'),
      content: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReadonlyCubit(),
          ),
          BlocProvider(
            create: (context) => FilterCubit(
              dto: ItemInserirRapidoSearchDTO(
                codItem: item.cod!,
                idEtiqueta: item.idEtiqueta!,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => GenerateCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit()..load(context),
          ),
        ],
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 500,
            minWidth: 500,
          ),
          height: size.height * 0.8,
          width: size.width * 0.6,
          child: const InserirRapidoWidget(),
        ),
      ),
      actions: [
        CancelButtonUnfilledWidget(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
