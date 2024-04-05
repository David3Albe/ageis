import 'package:ageiscme_admin/app/module/cubits/navigation_bar/navigation_bar_cubit.dart';
import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _ItemMenuHoverCubit extends Cubit<bool> {
  _ItemMenuHoverCubit() : super(false);
  void hover(bool hover) => emit(hover);
}

class ItemMenuChildrenWidget extends AnimatedWidget {
  ItemMenuChildrenWidget(
    Listenable height,
    this.item,
    this.itemPai,
    this.navExpanded,
  ) : super(listenable: height);
  final ItemMenuModel item;
  final ItemMenuModel itemPai;
  final bool navExpanded;

  final _ItemMenuHoverCubit hoverCubit = _ItemMenuHoverCubit();

  Animation<double> get height => listenable as Animation<double>;

  double getFontSize(Size size) {
    double height = size.height;
    if (height > 900) {
      return 14;
    } else if (height > 800) {
      return 13;
    } else if (height > 600) {
      return 12;
    } else if (height > 500) {
      return 11;
    } else if (height > 400) {
      return 10;
    }
    return 9;
  }

  (double, double) getSpacer(Size size) {
    double height = size.height;
    if (height > 900) {
      return (32, 24);
    } else if (height > 800) {
      return (28, 20);
    } else if (height > 600) {
      return (24, 16);
    } else if (height > 500) {
      return (20, 12);
    } else if (height > 400) {
      return (18, 8);
    }
    return (16, 6);
  }

  (double, double) getReductedSpacer(Size size) {
    double height = size.height;
    if (height > 900) {
      return (8, 24);
    } else if (height > 800) {
      return (7, 22);
    } else if (height > 600) {
      return (6, 20);
    } else if (height > 500) {
      return (5, 18);
    } else if (height > 400) {
      return (4, 16);
    }
    return (3, 14);
  }

  double getHeightSpacer(Size size) {
    double height = size.height;
    if (height > 900) {
      return 2;
    } else if (height > 800) {
      return 2;
    } else if (height > 600) {
      return 2;
    } else if (height > 500) {
      return 2;
    } else if (height > 400) {
      return 2;
    }
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = getFontSize(size);
    (double, double) spacer = getSpacer(size);
    (double, double) reductedSpacer = getReductedSpacer(size);
    double heightSpacer = getHeightSpacer(size);
    return Tooltip(
      waitDuration: const Duration(milliseconds: 500),
      message: item.text,
      child: Link(
        uri: kIsWeb && item.getChildrens().isEmpty
            ? Uri(path: '/admin' + item.route)
            : null,
        builder: (context, followLink) => InkWell(
          onTap: () => itemSelected(context, item),
          onHover: (bool hover) {
            hoverCubit.hover(hover);
          },
          child: BlocBuilder<_ItemMenuHoverCubit, bool>(
            bloc: hoverCubit,
            builder: (context, hovered) => AnimatedContainer(
              height: height.value,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              color: hovered ? Colors.grey[350] : null,
              child: Padding(
                padding: EdgeInsets.all(heightSpacer),
                child: Row(
                  children: [
                    Padding(
                      padding: navExpanded
                          ? EdgeInsets.only(left: spacer.$1, top: spacer.$2)
                          : EdgeInsets.only(
                              left: reductedSpacer.$1,
                              top: reductedSpacer.$2,
                            ),
                      child: Container(child: item.icon),
                    ),
                    navExpanded
                        ? Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, right: 3),
                              child: Text(
                                item.text,
                                softWrap: true,
                                maxLines: 4,
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ),
                          )
                        : Text(
                            item.text.substring(0, 4) + '...',
                            style: TextStyle(
                              fontSize: fontSize,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void itemSelected(BuildContext context, ItemMenuModel menu) async {
    if (item.getChildrens().isEmpty) {
      if (await AccessUserService.validateUserAccess(item)) {
        AdminNavigatorService.navigateTo(menu);
      } else {
        ToastUtils.showCustomToastWarning(
          context,
          'O Seu usuário não tem permissão para esta tela!',
        );
      }
    } else {
      final NavigationBarCubit _cubit =
          BlocProvider.of<NavigationBarCubit>(context);
      _cubit.changeItemExpanded(item);
    }
  }
}
