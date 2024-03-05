class DropDownFilterModel<T> {
  bool Function(T object) filterOperation;

  DropDownFilterModel(this.filterOperation);
}
