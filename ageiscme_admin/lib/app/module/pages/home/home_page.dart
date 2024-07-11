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
import 'package:compartilhados/windows/custom_default_window_component.dart';
import 'package:compartilhados/windows/windows_helper.dart';
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
      int chaveInsumo = WindowsHelper.GetNextChave();
      int chaveRegistroExpirar = WindowsHelper.GetNextChave();
      await Future.wait([
        showOverlayInsumos(chaveInsumo),
        showOverlayRegistrosExpirar(chaveRegistroExpirar),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }

  Future showOverlayInsumos(int chave) async {
    bool permissao = await AccessUserService.validateUserHasRight(
      DireitoEnum.InsumosSaldosConsulta,
    );
    if (!permissao) return;

    List<InsumoExpirarSearchResponseDTO> insumos =
        await InsumoSaldoService().searchExpirar(InsumoExpirarSearchDTO());
    if (insumos.isEmpty) return;
    SearchCubit searchCubit = SearchCubit();
    searchCubit.set(insumos);
    Size size = MediaQuery.of(context).size;
    double right = size.width / 5.5;
    double width = size.width / 3;
    double height = size.height * 0.8;

    final Widget widget =
        InsumosPopupPage(cubit: searchCubit, onClose: () => {});
    CustomDefaultWindowComponent? window;
    final GlobalKey<CustomDefaultWindowComponentState> key =
        GlobalKey<CustomDefaultWindowComponentState>();
    window = CustomDefaultWindowComponent(
      key: key,
      chave: chave,
      title: 'Insumos expirados e a expirar',
      height: height,
      ofssetBase: Offset(right, 10),
      width: width,
      child: widget,
      remove: WindowsHelper.RemoverWidget,
      setToLast: WindowsHelper.SetToLast,
      setToFirst: WindowsHelper.SetToFirst,
    );

    WindowsHelper.AdicionarOverlayCustomizada(
      key: key,
      chave: chave,
      overlay: window,
      title: 'Insumos expirados e a expirar',
    );
  }

  Future showOverlayRegistrosExpirar(int chave) async {
    bool permissao = await AccessUserService.validateUserHasRight(
      DireitoEnum.PermissaoVisualizacaoPopUp,
    );
    if (!permissao) return;
    List<RegistrosExpirarSearchResponseDTO> registros =
        await RegistrosExpirarService()
            .searchExpirar(RegistrosExpirarSearchDTO());
    if (registros.isEmpty) return;
    registros_expirar.SearchCubit searchCubit = registros_expirar.SearchCubit();
    searchCubit.set(registros);
    Size size = MediaQuery.of(context).size;
    double right = size.width / 1.85;
    double width = size.width / 2.5;
    double height = size.height * 0.8;

    final Widget widget =
        RegistrosPopupPage(cubit: searchCubit, onClose: () => {});
    final GlobalKey<CustomDefaultWindowComponentState> key =
        GlobalKey<CustomDefaultWindowComponentState>();
    CustomDefaultWindowComponent window = CustomDefaultWindowComponent(
      key: key,
      chave: chave,
      remove: WindowsHelper.RemoverWidget,
      setToFirst: WindowsHelper.SetToFirst,
      setToLast: WindowsHelper.SetToLast,
      title: 'Documentos vencidos e a vencer',
      width: width,
      height: height,
      ofssetBase: Offset(right, 10),
      child: widget,
    );

    WindowsHelper.AdicionarOverlayCustomizada(
      key: key,
      chave: chave,
      overlay: window,
      title: 'Documentos vencidos e a vencer',
    );
  }
}
