import 'package:compartilhados/componentes/campos/drop_down_cubit/drop_down_search_cubit.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

typedef ValidateBuilder<T> = void Function(
  BuildContext context,
  bool Function() validateMethodBuilder,
);

typedef SetSelectedItemBuilder<T> = void Function(
  BuildContext context,
  void Function(T? item) setSelectedItemMethod,
);

typedef RefreshItemBuilder<T> = void Function(
  BuildContext context,
  void Function() setRefreshItemMethod,
);

typedef SetReadonlyBuilder<T> = void Function(
  BuildContext context,
  void Function(bool readonly) setReadonlyMethod,
);

class DropDownSearchApiWidget<T> extends StatefulWidget {
  DropDownSearchApiWidget({
    required this.search,
    this.initialValue,
    this.onChanged,
    this.placeholder,
    this.textFunction,
    this.key,
    this.readOnly = false,
    this.validator,
    this.validateBuilder,
    this.setSelectedItemBuilder,
    this.setRefreshItemMethod,
    this.setReadonlyMethod,
  });
  final T? initialValue;
  final String? placeholder;
  final void Function(T? value)? onChanged;
  final List<String Function(T value)> validators = [];
  final String Function(T)? textFunction;
  final Key? key;
  final Future<List<T>> Function(String? text) search;
  final bool readOnly;
  final String? Function(T? val)? validator;
  late final ValidateBuilder<T>? validateBuilder;
  final SetSelectedItemBuilder<T>? setSelectedItemBuilder;
  final RefreshItemBuilder<T>? setRefreshItemMethod;
  final SetReadonlyBuilder<T>? setReadonlyMethod;

  @override
  DropDownSearchApiWidgetState<T> createState() =>
      DropDownSearchApiWidgetState<T>(
        onChanged: onChanged,
        readOnly: readOnly,
        key: key,
      );
}

class DropDownSearchApiWidgetState<T>
    extends State<DropDownSearchApiWidget<T>> {
  List<T> sourceList = [];
  T? selectedItem;
  late final FocusNode focus;
  late final FocusNode focustxt;
  set selectedValue(T value) => selectedItem = value;
  late bool filterVisible;
  final void Function(T? value)? onChanged;
  late final TextFieldStringWidget txtFilter;
  static const int MAX_ITENS = 1000;
  late final DropDownSearchCubit<T> cubit;
  List<DateTime> lastTypedsTime = [];
  final Key? key;
  String? errorText;
  bool readOnly;

  DropDownSearchApiWidgetState({
    required this.readOnly,
    this.onChanged,
    this.key,
  });
  @override
  void initState() {
    filterVisible = false;
    txtFilter = TextFieldStringWidget(
      placeholder: 'Pesquisar...',
      onChanged: setItems,
    );

    if (widget.initialValue != null) {
      selectedItem = widget.initialValue;
      sourceList.add(selectedItem!);
    }
    cubit = DropDownSearchCubit<T>();
    setItems(null);
    super.initState();
  }

  void refresh() {
    setItems(txtFilter.text);
  }

  void validate() {
    if (widget.validator == null) return;
    String? error = widget.validator!(selectedItem);
    setState(() => errorText = error);
  }

  bool valid() {
    validate();
    return errorText == null || errorText!.isEmpty;
  }

  void setSelected(T? item) {
    setState(() {
      selectedItem = item;
      if (widget.onChanged != null) widget.onChanged!(item);
    });
  }

  void setReadonly(bool readonly) {
    this.readOnly = readonly;
  }

  @override
  Widget build(BuildContext context) {
    widget.setSelectedItemBuilder?.call(
      context,
      setSelected,
    );
    widget.validateBuilder?.call(
      context,
      valid,
    );
    widget.setRefreshItemMethod?.call(
      context,
      refresh,
    );
    widget.setReadonlyMethod?.call(
      context,
      setReadonly,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (!readOnly) {
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
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                        color: errorText != null && !errorText!.isEmpty
                            ? Colors.red
                            : Colors.black12,
                      ),
                    ),
                  ),
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
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: LoadingWidget());
        }
        if (state.notFound) {
          return const Center(
            child: Text('Nenhum registro encontrado'),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: state.items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 2.0),
          itemBuilder: (context, index) {
            T item = state.items[index];
            String text = getItemText(item);
            return InkWell(
              onTap: () => _setShowDialogItem(item),
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
        );
      },
    );
  }

  void _setShowDialogItem(T item) {
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
      height: _getHeight(size),
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
                Expanded(
                  child: SelectableText(
                    onTap: () {
                      if (!readOnly) {
                        showPicker(context);
                      }
                    },
                    maxLines: 1,
                    item == null ? widget.placeholder ?? '' : text,
                    style: Fontes.getRoboto(
                      cor: errorText != null && !errorText!.isEmpty
                          ? Colors.red
                          : readOnly
                              ? Colors.grey
                              : null,
                      fontSize: HelperFunctions.calculaFontSize(context, 14),
                    ),
                  ),
                ),
                if (item != null) ...{
                  const Spacer(),
                  SizedBox(
                    child: InkWell(
                      child: const Icon(Symbols.close),
                      onTap: () {
                        if (!readOnly) clearItem();
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

  Future<List<T>> Filter(String? filter) async {
    List<T> items = await widget.search(filter);
    return items;
  }

  Future setItems(String? filter) async {
    cubit.setLoading();
    lastTypedsTime.add(DateTime.now());
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    lastTypedsTime.removeAt(0);
    if (lastTypedsTime.isNotEmpty) return;
    List<T> itens = await Filter(filter);
    if (selectedItem != null && !itens.contains(selectedItem)) {
      itens.insert(0, selectedItem!);
    }
    cubit.SetItems(itens);
    if (itens.isEmpty) cubit.setNotFound();
  }
}
