class SortedColumn {
  bool sorted;
  TypeSort type;
  SortedColumn({this.sorted = false, this.type = TypeSort.None});
}

enum TypeSort {
  Ascending,
  Descending,
  None,
}
