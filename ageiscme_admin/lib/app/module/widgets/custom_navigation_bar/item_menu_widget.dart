import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/icon_father_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/item_menu_children_widget.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemMenuWidget extends StatefulWidget {
  const ItemMenuWidget(
    this.item,
    this.expanded,
  );
  final ItemMenuModel item;
  final bool expanded;

  @override
  State<ItemMenuWidget> createState() => _ItemMenuWidgetState();
}

class _ItemMenuHoverCubit extends Cubit<bool> {
  _ItemMenuHoverCubit() : super(false);
  void hover(bool hover) => emit(hover);
}

class _ItemMenuWidgetState extends State<ItemMenuWidget>
    with SingleTickerProviderStateMixin {
  bool hovered = false;
  late AnimationController controller;
  late final _ItemMenuHoverCubit hoverCubit;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    hoverCubit = _ItemMenuHoverCubit();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    hoverCubit.close();
    super.dispose();
  }

  double getSpacer(Size size) {
    double height = size.height;
    if (height > 900) {
      return 8;
    } else if (height > 800) {
      return 7;
    } else if (height > 600) {
      return 6;
    } else if (height > 500) {
      return 5;
    } else if (height > 400) {
      return 4;
    }
    return 3;
  }

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double spacer = getSpacer(size);
    double fontSize = getFontSize(size);
    return Column(
      children: [
        Tooltip(
          waitDuration: const Duration(milliseconds: 500),
          message: widget.item.text,
          child: Link(
            uri: kIsWeb && widget.item.getChildrens().isEmpty
                ? Uri(path: widget.item.route)
                : null,
            builder: (context, followLink) => InkWell(
              onTap: () => itemSelected(context, widget.item),
              onHover: (bool hover) {
                hoverCubit.hover(hover);
              },
              child: BlocBuilder<_ItemMenuHoverCubit, bool>(
                bloc: hoverCubit,
                builder: (context, state) => Container(
                  color: state ? Colors.grey[350] : null,
                  child: Padding(
                    padding: EdgeInsets.all(spacer),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(child: widget.item.icon),
                        const Spacer(),
                        widget.expanded
                            ? Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: spacer),
                                  child: Text(
                                    widget.item.text,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        const Spacer(flex: 1),
                        IconFatherWidget(widget.item),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        for (ItemMenuModel filho in widget.item.getChildrens()) ...{
          ItemMenuChildrenWidget(
            Tween<double>(
              begin: 0,
              end: _getChildenHeight(filho.text.runes.length, size),
            ).animate(controller),
            filho,
            widget.item,
            widget.expanded,
          ),
        },
      ],
    );
  }

  double getHeightChildrenByRes(double value, Size size) {
    double height = size.height;
    if (height > 900) {
      return value;
    } else if (height > 800) {
      return value - 2;
    } else if (height > 700) {
      return value - 4;
    } else if (height > 600) {
      return value - 6;
    } else if (height > 500) {
      return value - 8;
    } else if (height > 400) {
      return value - 10;
    }
    return value - 12;
  }

  double _getChildenHeight(int length, Size size) {
    if (length * 1.7 < 40) return getHeightChildrenByRes(40, size);
    if (length * 1.7 < 45) return getHeightChildrenByRes(50, size);
    if (length * 1.7 < 50) return getHeightChildrenByRes(55, size);
    if (length * 1.7 < 55) return getHeightChildrenByRes(60, size);
    if (length * 1.7 < 60) return getHeightChildrenByRes(65, size);
    if (length * 1.7 < 65) return getHeightChildrenByRes(70, size);
    return length * 1.7;
  }

  void itemSelected(
    BuildContext context,
    ItemMenuModel menu,
  ) async {
    if (widget.item.getChildrens().isEmpty) {
      if (await AccessUserService.validateUserAccess(widget.item)) {
        AdminNavigatorService.navigateTo(menu);
      } else {
        ToastUtils.showCustomToastWarning(
          context,
          'O Seu usuário não tem permissão para esta tela!',
        );
      }
    } else {
      setState(() {
        widget.item.expandido = !widget.item.expandido;
        if (widget.item.expandido) {
          controller.forward();
        } else {
          controller.reverse();
        }
      });
    }
  }
}
