import 'package:ageiscme_models/response_dto/kit/mesma_cor/kit_mesma_cor_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/mesma_cor/kits/kit_mesma_cor_kit_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:flutter/material.dart';

class KitMesmaCorPageWidget extends StatelessWidget {
  const KitMesmaCorPageWidget({
    required this.mesmaCor,
    super.key,
  });
  final KitMesmaCorResponseDTO mesmaCor;
  List<KitMesmaCorKitResponseDTO> get kits => mesmaCor.kits;
  String getDescricao(KitMesmaCorKitResponseDTO kit) {
    return '${kit.codBarra} - ${kit.descricao ?? 'Sem descritor'}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Kits com as mesmas cores identificados'),
      content: Container(
        constraints: const BoxConstraints(minHeight: 400, minWidth: 500),
        height: size.height * 0.6,
        width: size.width * 0.6,
        child: ListView.builder(
          itemCount: kits.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(getDescricao(kits[index])),
            );
          },
        ),
      ),
      actions: [
        SaveButtonWidget(
          onPressed: () {
            _salvar(context: context);
          },
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => _cancelar(context: context),
        ),
      ],
    );
  }

  void _salvar({
    required BuildContext context,
  }) {
    Navigator.of(context).pop(true);
  }

  void _cancelar({
    required BuildContext context,
  }) {
    Navigator.of(context).pop(false);
  }
}
