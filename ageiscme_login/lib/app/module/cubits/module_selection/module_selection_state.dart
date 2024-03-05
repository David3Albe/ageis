abstract class ModuleSelectionState {
  final bool hover;
  @override
  ModuleSelectionState(this.hover);
}

class ModuleSelectionInitState extends ModuleSelectionState {
  ModuleSelectionInitState() : super(false);
}

class ModuleSelectionChangedState extends ModuleSelectionState {
  ModuleSelectionChangedState(bool hover) : super(hover);
}
