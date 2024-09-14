import 'package:flutter/material.dart';
import 'package:project_for_all/models/requests_model.dart';

class AddOrderProvider with ChangeNotifier {
  String _selectedCategoryCardName = '';
  String get selectedCategoryCardName => _selectedCategoryCardName;
  set selectedCategoryCardName(String value) {
    _selectedCategoryCardName = value;
    notifyListeners();
  }

  String _selectedDateAndDay = '';
  String get selectedDateAndDay => _selectedDateAndDay;
  set selectedDateAndDay(String value) {
    _selectedDateAndDay = value;
    notifyListeners();
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String value) {
    _selectedTime = value;
    notifyListeners();
  }

  String _requestId = '';
  String get requestId => _requestId;
  set requestId(String value) {
    _requestId = value;
    notifyListeners();
  }

  String _state = '';
  String get state => _state;
  set state(String value) {
    _state = value;
    notifyListeners();
  }

  RequestsModel _requestModel = RequestsModel();
  RequestsModel get requestModel => _requestModel;
  set requestModel(RequestsModel value) {
    _requestModel = value;
    notifyListeners();
  }

  TextEditingController _workDescriptionController = TextEditingController();
  TextEditingController get workDescriptionController =>
      _workDescriptionController;
  set workDescriptionController(TextEditingController value) {
    _workDescriptionController = value;
    notifyListeners();
  }
}
