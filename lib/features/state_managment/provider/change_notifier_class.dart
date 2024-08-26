import 'package:flutter/material.dart';

class ServiceAppProvider with ChangeNotifier {


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _visible = true;
  bool get visible => _visible;
  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }


  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get password => _password;



  void updateIsloading(bool NewValue) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void updateValue(bool newValue) {
    _visible = newValue;
    notifyListeners();
  }

  void updatePassword(TextEditingController newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void updateEmail(TextEditingController newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}
