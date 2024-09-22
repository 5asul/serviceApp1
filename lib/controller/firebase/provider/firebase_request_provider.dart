import 'package:flutter/material.dart';

import '../../../models/requests_model.dart';
import '../services/firebase_requests_services.dart';

class FirebaseRequestProvider with ChangeNotifier {
  final FirebaseRequestsServices _requestsServices = FirebaseRequestsServices();
  FirebaseRequestsServices get requestsServices => _requestsServices;

  String _selectedCardId = '';
  String get selectedCardId => _selectedCardId;
  set selectedCardId(String value) {
    _selectedCardId = value;
    notifyListeners();
  }

  String _workerId = '';
  String get workerId => _workerId;
  set workerId(String value) {
    _workerId = value;
    notifyListeners();
  }


  String _userSelectedCardId = '';
  String get userSelectedCardId => _userSelectedCardId;
  set userSelectedCardId(String value) {
    _userSelectedCardId = value;
    notifyListeners();
  }

  String _selectedStatusButton = '';
  String get selectedStatusButton => _selectedStatusButton;
  set selectedStatusButton(String value) {
    _selectedStatusButton = value;
    notifyListeners();
  }

  List<RequestsModel> _requests = [];
  List<RequestsModel> get requests => _requests;

  RequestsModel _request = RequestsModel();
  RequestsModel get request => _request;

  void fetchRequests() {
    _requestsServices.getRequestsStream().listen((RequestsModel) {
      _requests = RequestsModel;
      notifyListeners();
    });
  }

  void addRequest(RequestsModel model) async {
    await _requestsServices.addRequest(model);
    notifyListeners();
  }

  void updateRequest(RequestsModel model) async {
    _requestsServices.updateRequest(model);
    notifyListeners();
  }

  void deleteRequest(String requestId) async {
    await _requestsServices.deleteRequest(requestId);
    notifyListeners();
  }

  void getRequestsStreamById(requestId) {
    _requestsServices.getRequestsStreamById(requestId).listen((RequestsModel) {
      _requests = RequestsModel;
      notifyListeners();
    });
  }

  void getWorkerRequestsStreamById(requestId) {
    _requestsServices.getWorkerRequestsStreamById(requestId).listen((RequestsModel) {
      _requests = RequestsModel;
      notifyListeners();
    });
  }
}
