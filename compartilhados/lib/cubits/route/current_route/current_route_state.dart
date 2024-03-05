abstract class CurrentRouteState {
  String currentRoute;
  @override
  CurrentRouteState(this.currentRoute);
}

class CurrentRouteInitState extends CurrentRouteState {
  CurrentRouteInitState(String route) : super(route);
}

class CurrentRouteChangedState extends CurrentRouteState {
  CurrentRouteChangedState(String route) : super(route);
}
