import 'package:ageiscme_admin/app/module/pages/home/registros_popup/registros_popup_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/insumos_popup_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/search_cubit.dart'
    as registros_expirar;
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/insumo_saldo/insumo_saldo_service.dart';
import 'package:ageiscme_data/services/registros_expirar/registros_expirar_service.dart';
import 'package:ageiscme_models/dto/insumo/expirar/insumo_expirar_search_dto.dart';
import 'package:ageiscme_models/dto/registros/expirar/registros_expirar_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/response_dto/insumo/expirar/insumo_expirar_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
import 'package:compartilhados/componentes/overlay/custom_overlay_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OverlayEntry? overlayInsumo;
  OverlayEntry? overlayRegistro;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        showOverlayInsumos(),
        showOverlayRegistrosExpirar(),
      ]);
      _inserirOverlays();
    });
  }

  void _inserirOverlays() {
    if (overlayInsumo != null) {
      Overlay.of(context).insert(overlayInsumo!);
    }
    if (overlayRegistro != null) {
      Overlay.of(context).insert(overlayRegistro!, below: overlayInsumo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }

  Future showOverlayInsumos() async {
    bool permissao = await AccessUserService.validateUserHasRight(
      DireitoEnum.PermissaoVisualizacaoPopUp,
    );
    if (!permissao) return;

    List<InsumoExpirarSearchResponseDTO> insumos =
        await InsumoSaldoService().searchExpirar(InsumoExpirarSearchDTO());
    if (insumos.isEmpty) return;
    SearchCubit searchCubit = SearchCubit();
    searchCubit.set(insumos);
    late OverlayEntry overlayEntry;
    late CustomOverlayWidget overlayWidget = CustomOverlayWidget(
      onEnter: () => onEnter(overlayInsumo!),
      height: 350,
      onClose: overlayEntry.remove,
      width: 600,
      child: InsumosPopupPage(
        cubit: searchCubit,
        onClose: removerOverlays,
      ),
    );

    overlayEntry = OverlayEntry(
      builder: (context) => overlayWidget,
    );

    overlayInsumo = overlayEntry;
  }

  void removerOverlays() {
    overlayInsumo?.remove();
    overlayRegistro?.remove();
  }

  void onEnter(OverlayEntry entry) {
    entry.remove();
    Overlay.of(context).insert(entry);
  }

  Future showOverlayRegistrosExpirar() async {
    List<RegistrosExpirarSearchResponseDTO> registros =
        await RegistrosExpirarService()
            .searchExpirar(RegistrosExpirarSearchDTO());
    if (registros.isEmpty) return;
    registros_expirar.SearchCubit searchCubit = registros_expirar.SearchCubit();
    searchCubit.set(registros);
    late OverlayEntry overlayEntry;
    double right = MediaQuery.of(context).size.width / 3;

    late CustomOverlayWidget overlayWidget = CustomOverlayWidget(
      onEnter: () => onEnter(overlayRegistro!),
      ofssetBase: Offset(right, 0),
      height: 500,
      onClose: overlayEntry.remove,
      width: 800,
      child: RegistrosPopupPage(
        cubit: searchCubit,
        onClose: removerOverlays,
      ),
    );

    overlayEntry = OverlayEntry(
      builder: (context) => overlayWidget,
    );

    overlayRegistro = overlayEntry;
  }
}
