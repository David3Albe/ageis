import 'package:ageiscme_admin/app/module/cubits/navigation_bar/navigation_bar_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/custom_navigation_bar_cubit.dart';
import 'package:ageiscme_data/components/custom_app_bar_widget.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/custom_navigation_bar_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/navigation_bar_routes/navigation_bar_routes_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class RouterOutletPage extends StatelessWidget {
  const RouterOutletPage({super.key});

  @override
  Widget build(BuildContext context) {
    ToastUtils.routerOutletContext = context;
    bool resumeView = MediaQuery.of(context).size.width < 800;
    return CustomAppBarWidget(
      drawer: resumeView == true ? const CustomNavigationBarWidget() : null,
      onLogout: () => onLogout(context),
      body: BlocProvider(
        create: (context) => NavigationBarCubit(),
        child: Row(
          children: [
            if (!resumeView) ...{
              const CustomNavigationBarWidget(),
            },
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0),
                child: Column(
                  children: [
                    NavigationBarRoutesWidget(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: RouterOutlet(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLogout(BuildContext context) async {
    CustomNavigationBarCubit cubit =
        BlocProvider.of<CustomNavigationBarCubit>(context);
    cubit.expand();
    AuthenticationStore store = Modular.get<AuthenticationStore>();
    await store.ClearAuthentication();
  }
}
