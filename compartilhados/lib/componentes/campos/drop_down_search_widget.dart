import 'package:compartilhados/componentes/campos/drop_down_cubit/drop_down_search_cubit.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

typedef RefreshSourceListBuilder = void Function(
  BuildContext context,
  void Function() refreshSourceListMethod,
);

typedef SetSelectedItemBuilder<T> = void Function(
  BuildContext context,
  void Function(T? item) setSelectedItemMethod,
);

class DropDownSearchWidget<T> extends StatefulWidget {
  DropDownSearchWidget({
    required this.sourceList,
    this.initialValue,
    this.onChanged,
    this.placeholder,
    this.textFunction,
    this.key,
    this.refreshSourceListBuilder,
    this.setSelectedItemBuilder,
    this.readOnly = false,
    this.validateChange,
    this.expandOnStart,
  });
  final List<T> sourceList;
  final T? initialValue;
  final String? placeholder;
  final void Function(T? value)? onChanged;
  final List<String Function(T value)> validators = [];
  final String Function(T)? textFunction;
  final Key? key;
  final bool readOnly;
  late final RefreshSourceListBuilder? refreshSourceListBuilder;
  late final SetSelectedItemBuilder<T>? setSelectedItemBuilder;
  final Future<bool> Function(T? itemSelecionado)? validateChange;
  final bool? expandOnStart;

  @override
  DropDownSearchWidgetState<T> createState() => DropDownSearchWidgetState<T>(
        onChanged: onChanged,
        key: key,
      );
}

class DropDownSearchWidgetState<T> extends State<DropDownSearchWidget<T>> {
  T? selectedItem;
  late final FocusNode focus;
  late final FocusNode focustxt;
  set selectedValue(T value) => selectedItem = value;
  late bool filterVisible;
  final void Function(T? value)? onChanged;
  late final TextFieldStringWidget txtFilter;
  static const int MAX_ITENS = 30;
  late final DropDownSearchCubit<T> cubit;
  DateTime? lastTypedTime;
  final Key? key;

  DropDownSearchWidgetState({this.onChanged, this.key});
  @override
  void initState() {
    filterVisible = false;
    txtFilter = TextFieldStringWidget(
      placeholder: 'Pesquisar...',
      onChanged: (search) => setItems(search, false),
    );

    if (widget.sourceList.isNotEmpty && selectedItem == null) {
      selectedItem = widget.initialValue;
    }
    cubit = DropDownSearchCubit<T>();
    setItems(
      null,
      true,
    );

    super.initState();
    if (widget.expandOnStart == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showPicker(context));
    }
  }

  void reload() {
    setItems(txtFilter.text, false);
  }

  void setSelected(T? item) {
    setState(() {
      selectedItem = item;
      if (widget.onChanged != null) widget.onChanged!(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.setSelectedItemBuilder?.call(
      context,
      setSelected,
    );
    widget.refreshSourceListBuilder?.call(
      context,
      reload,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (!widget.readOnly) {
              showPicker(context);
            }
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: getSelectedItemText(
                    selectedItem,
                    context,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void setItem(T? item) {
    setState(() {
      selectedItem = item;
      if (onChanged == null) return;
      onChanged!(item);
    });
  }

  T? setItemByExpression(bool Function(T element) expressaoItem) {
    T? item = widget.sourceList
        .where((element) => expressaoItem(element))
        .firstOrNull;
    setState(() {
      selectedItem = item;
    });
    return item;
  }

  void showPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: txtFilter,
        contentPadding: const EdgeInsets.all(16),
        titlePadding: const EdgeInsets.all(16),
        actionsPadding: const EdgeInsets.all(16),
        content: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(padding: EdgeInsets.only(top: 8)),
                getListItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getItemText(T? item) {
    String text = '';
    if (item != null) {
      if (widget.textFunction != null) {
        text = widget.textFunction!(item);
      } else if (item is DropDownText) {
        text = item.GetDropDownText();
      } else {
        text = item.toString();
      }
    }
    return text;
  }

  Widget getListItems() {
    Color corSelecionado = Colors.lightBlue.shade500;
    return BlocBuilder<DropDownSearchCubit<T>, DropDownSearchState>(
      bloc: cubit,
      builder: (context, state) => ListView.separated(
        shrinkWrap: true,
        itemCount: state.items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 2.0),
        itemBuilder: (context, index) {
          T item = state.items[index];
          String text = getItemText(item);
          return InkWell(
            onTap: () => _setShowDialogItem(item, context),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Text(
                      text,
                      style: Fontes.getRoboto(
                        cor: selectedItem == item ? corSelecionado : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (selectedItem == item) ...{
                      Icon(
                        Symbols.check_box,
                        color: corSelecionado,
                      ),
                    },
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _setShowDialogItem(T item, BuildContext context) async {
    bool valid = true;
    if (widget.validateChange != null) {
      valid = await widget.validateChange!(item);
    }
    if (!valid) {
      Navigator.of(context).pop();
      return;
    }
    if (onChanged != null) {
      onChanged!(item);
    }
    setState(() {
      selectedItem = item;
    });
    Navigator.of(context).pop();
  }

  Widget getSelectedItemText(T? item, BuildContext context) {
    String text = getItemText(item);
    return Container(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item != null) ...{
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.placeholder ?? '',
                  style: Fontes.getRoboto(
                    cor: Cores.corPlaceholderTextField,
                    fontSize: HelperFunctions.calculaFontSize(context, 12),
                  ),
                ),
              ),
            },
            Row(
              children: [
                Text(
                  item == null ? widget.placeholder ?? '' : text,
                  style: Fontes.getRoboto(
                    fontSize: HelperFunctions.calculaFontSize(context, 16),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (item != null) ...{
                  const Spacer(),
                  SizedBox(
                    child: InkWell(
                      child: const Icon(Symbols.close),
                      onTap: () {
                        if (!widget.readOnly) clearItem();
                      },
                    ),
                  ),
                },
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clearItem() {
    setState(() {
      selectedItem = null;
      if (onChanged != null) {
        onChanged!(selectedItem);
      }
    });
  }

  List<T> Filter(String? filter) {
    List<T> items = [];
    if (widget.sourceList.isEmpty) {
      return [];
    }
    if (filter == null || filter.isEmpty) {
      int maxItens = widget.sourceList.length >= MAX_ITENS
          ? MAX_ITENS
          : widget.sourceList.length;
      return widget.sourceList.getRange(0, maxItens).toList();
    }
    for (T item in widget.sourceList) {
      List<DropDownFilterModel<T>> filters = [];
      if (item is DropDownFilterMixin<T>) {
        filters = item.GetDropDownFilters(filter);
      }
      bool itemValid = false;
      for (DropDownFilterModel<T> filter in filters) {
        bool itemValidation = filter.filterOperation(item);
        if (!itemValid) itemValid = itemValidation;
      }
      if (!itemValid) continue;
      items.add(item);
      if (items.length == MAX_ITENS) {
        return items;
      }
    }
    return items;
  }

  void setItems(String? filter, bool ignoreTimer) async {
    lastTypedTime = DateTime.now();
    DateTime lastTimeValidation = lastTypedTime!;
    if (!ignoreTimer) {
      await Future.delayed(
        const Duration(milliseconds: 1500),
      );
    }
    List<T> itens = Filter(filter);
    if (selectedItem != null && !itens.contains(selectedItem)) {
      itens.insert(0, selectedItem!);
    }
    if (lastTimeValidation == lastTypedTime) cubit.SetItems(itens);
  }
}
