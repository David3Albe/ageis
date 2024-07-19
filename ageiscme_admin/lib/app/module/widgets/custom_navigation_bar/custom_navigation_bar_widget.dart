import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/custom_navigation_bar_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/items_menu_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/menu_items_widget.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CustomNavigationBarWidget extends StatefulWidget {
  const CustomNavigationBarWidget({super.key});

  @override
  State<CustomNavigationBarWidget> createState() =>
      _CustomNavigationBarWidgetState();
}

class CustomNavigationBarAnimated extends AnimatedWidget {
  CustomNavigationBarAnimated({
    required super.listenable,
    required this.itens,
    required this.expanded,
    required this.toogleExpand,
  });

  Animation<double> get width => listenable as Animation<double>;
  final List<ItemMenuModel> itens;
  final void Function() toogleExpand;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      width: width.value,
      color: Cores.corMenuItens,
      child: MenuItemsWidget(
        expanded: expanded,
        items: itens,
        toogleExpand: toogleExpand,
      ),
    );
  }
}

class _CustomNavigationBarWidgetState extends State<CustomNavigationBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _widthAnimation;
  late final ItemsMenuCubit cubit; 

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    cubit = ItemsMenuCubit();
    cubit.loadItems();

    super.initState();
  }

  (double, double) getWidthAppBar(Size size) {
    double height = size.height;
    if (height > 800) {
      return (250, 78);
    } else if (height > 700) {
      return (230, 72);
    } else if (height > 600) {
      return (210, 68);
    }
    return (190, 64);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    (double, double) width = getWidthAppBar(size);
    _widthAnimation =
        Tween<double>(begin: width.$1, end: width.$2).animate(_controller);
    return Material(
      elevation: 150,
      child: BlocBuilder<ItemsMenuCubit, List<ItemMenuModel>>(
        bloc: cubit,
        builder: (context, itens) {
          return ExcludeFocusTraversal(
            child: BlocConsumer<CustomNavigationBarCubit,
                CustomNavigationBarState>(
              listener: (context, state) => changeExpanded(state.expanded),
              builder: (context, state) => CustomNavigationBarAnimated(
                listenable: _widthAnimation,
                itens: itens,
                expanded: state.expanded,
                toogleExpand: setExpanded,
              ),
            ),
          );
        },
      ),
    );
  }

  void changeExpanded(bool expanded) {
    if (expanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  void setExpanded() {
    context.read<CustomNavigationBarCubit>().toogleExpanded();
  }
}
