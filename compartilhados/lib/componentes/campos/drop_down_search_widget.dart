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

typedef ValidateBuilder<T> = void Function(
  BuildContext context,
  bool Function() validateMethodBuilder,
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
    this.validator,
    this.validateBuilder,
    this.cor,
    this.maxItems = 1000,
    this.ignoreHeight = false,
    this.useDecoration = true,
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
  late final ValidateBuilder<T>? validateBuilder;
  final Future<bool> Function(T? itemSelecionado)? validateChange;
  final bool? expandOnStart;
  final String? Function(T? val)? validator;
  final int maxItems;
  final Color? cor;
  final bool ignoreHeight;
  final bool useDecoration;

  @override
  DropDownSearchWidgetState<T> createState() => DropDownSearchWidgetState<T>(
        maxItems: maxItems,
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
  late final DropDownSearchCubit<T> cubit;
  final int maxItems;
  DateTime? lastTypedTime;
  final Key? key;
  String? errorText;
  final String? Function(T? val)? validator;

  DropDownSearchWidgetState({
    required this.maxItems,
    this.validator,
    this.onChanged,
    this.key,
  });
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
    widget.validateBuilder?.call(
      context,
      valid,
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
                  decoration: widget.useDecoration
                      ? BoxDecoration(
                          color: widget.cor,
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: errorText != null && !errorText!.isEmpty
                                  ? Colors.red
                                  : Colors.grey.shade500.withAlpha(200),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: errorText != null && errorText!.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    errorText ?? '',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
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

  void validate() {
    if (widget.validator == null) return;
    String? error = widget.validator!(selectedItem);
    setState(() => errorText = error);
  }

  bool valid() {
    validate();
    bool valid = errorText == null || errorText!.isEmpty;
    return valid;
  }

  void showPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            if (widget.placeholder != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.placeholder ?? '',
                    style: Fontes.getRoboto(fontSize: 14),
                  ),
                ],
              ),
            txtFilter,
          ],
        ),
        contentPadding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 4,
          bottom: 12,
        ),
        titlePadding: const EdgeInsets.all(12),
        actionsPadding: const EdgeInsets.all(16),
        content: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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

  void _setShowDialogItem(
    T item,
    BuildContext context,
  ) async {
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
    validate();
    Navigator.of(context).pop();
  }

  double _getHeight(Size size) {
    double height = size.height;
    if (height > 800) {
      return 52;
    } else if (height > 700) {
      return 50;
    } else if (height > 600) {
      return 49;
    } else if (height > 500) {
      return 48;
    } else if (height > 400) {
      return 46;
    }
    return 44;
  }

  Widget getSelectedItemText(T? item, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String text = getItemText(item);
    return Container(
      height: widget.ignoreHeight ? null : _getHeight(size),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item != null && widget.placeholder != null) ...{
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.placeholder ?? '',
                  style: Fontes.getRoboto(
                    cor: errorText != null && !errorText!.isEmpty
                        ? Colors.red
                        : Cores.corPlaceholderTextField,
                    fontSize: HelperFunctions.calculaFontSize(context, 14),
                  ),
                ),
              ),
            },
            Row(
              children: [
                Text(
                  item == null ? widget.placeholder ?? '' : text,
                  style: Fontes.getRoboto(
                    cor: errorText != null && !errorText!.isEmpty
                        ? Colors.red
                        : widget.readOnly
                            ? Colors.grey
                            : null,
                    fontSize: HelperFunctions.calculaFontSize(context, 14),
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
      validate();
    });
  }

  List<T> Filter(String? filter) {
    List<T> items = [];
    if (widget.sourceList.isEmpty) {
      return [];
    }
    if (filter == null || filter.isEmpty) {
      int maxItens = widget.sourceList.length >= widget.maxItems
          ? widget.maxItems
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
      if (items.length == widget.maxItems) {
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
        const Duration(milliseconds: 500),
      );
    }
    List<T> itens = Filter(filter);
    if (selectedItem != null && !itens.contains(selectedItem)) {
      itens.insert(0, selectedItem!);
    }
    if (lastTimeValidation == lastTypedTime) cubit.SetItems(itens);
  }
}
