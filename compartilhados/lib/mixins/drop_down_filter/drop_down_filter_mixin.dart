import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';

mixin DropDownFilterMixin<T> {
  List<DropDownFilterModel<T>> GetDropDownFilters(String filter);
}