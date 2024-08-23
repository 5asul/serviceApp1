import 'package:flutter/material.dart';

class ServiceAppProvider with ChangeNotifier{

  bool _visible = true;
  bool get visible => _visible;

  void updateValue(bool newValue) {
    _visible = newValue;
    notifyListeners();
  }


}