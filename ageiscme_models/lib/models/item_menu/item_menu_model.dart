import 'package:flutter/material.dart';

class ItemMenuModel {
  Icon? icon;

  String text;

  String route;

  List<ItemMenuModel> _childrens = [];

  List<int>? rights = [];

  ItemMenuModel? _father;

  bool expandido = false;

  ItemMenuModel(this.text, {this.route = '', this.rights});

  String getFullRoute() {
    String fullRoute = '';
    List<String> routes = [];
    routes.add(route);
    _addFatherRotes(this, routes);
    routes.add('/admin');
    fullRoute = routes.reversed.join('');
    return fullRoute;
  }

  _addFatherRotes(ItemMenuModel item, List<String> routes) {
    if (item._father != null) {
      routes.add(item._father!.route);
      _addFatherRotes(item._father!, routes);
    }
  }

  List<ItemMenuModel> getChildrens() {
    return _childrens;
  }

  void addChildren(ItemMenuModel item) {
    _childrens.add(item);
    item._father = this;
  }

  ItemMenuModel? getFather() {
    return _father;
  }
}
