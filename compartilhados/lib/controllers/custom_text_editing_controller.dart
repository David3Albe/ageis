import 'package:flutter/material.dart';

class CustomTextEditingController extends TextEditingController {
  List<String Function(String str)> validators = [];
  List<String> _errors = [];

  bool valid() => _errors.isEmpty;

  void setErrors() {
    _errors = [];
    for (String Function(String str) func in validators) {
      String error = func(text);
      if (error.isNotEmpty) return _errors.add(error);
    }
  }

  String getFirstErrorOrEmpty() {
    if (_errors.isNotEmpty) return _errors.first;
    return '';
  }

  void addValidator(String Function(String str) func) => validators.add(func);
}
