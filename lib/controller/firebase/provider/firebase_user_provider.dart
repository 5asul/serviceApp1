



import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/services/firebase_user_services.dart';
import 'package:project_for_all/models/users_model.dart';

class FirebaseUserProvider with ChangeNotifier {
  final FirebaseUserServices _userService = FirebaseUserServices();

  

  List<UserModel> _users = [];
  UserModel _user = UserModel();
  List<UserModel> get users => _users;
  UserModel get user => _user;

  

  void fetchUsers() {
    _userService.getUsersStream().listen((UserModel) {
      _users = UserModel;
      notifyListeners();
    });
  }

  void addUser(UserModel model) async {
    await _userService.addUser(model);
    notifyListeners();
  }

  void updateUser(UserModel model) async {
    await _userService.updateUser(model);
    notifyListeners();
  }

  void deleteUser(String userId) async {
    await _userService.deleteUser(userId);
    notifyListeners();
  }

  void getUsersStreamById(userId) {
    _userService.getUsersStreamById(userId).listen((UserModel) {
      _user = UserModel[0];
      notifyListeners();
    });
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
