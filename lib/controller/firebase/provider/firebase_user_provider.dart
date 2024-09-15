import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_for_all/controller/firebase/services/firebase_user_services.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:project_for_all/models/users_model.dart';

class FirebaseUserProvider with ChangeNotifier {
  final FirebaseUserServices _userService = FirebaseUserServices();

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  UserModel _user = UserModel();
  UserModel get user => _user;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;
  set UsernameController(TextEditingController value) {
    _usernameController = value;
    notifyListeners();
  }

  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  set phoneController(TextEditingController value) {
    _phoneController = value;
    notifyListeners();
  }

  TextEditingController _profilePictureController = TextEditingController();
  TextEditingController get profilePictureController =>
      _profilePictureController;
  set profilePictureController(TextEditingController value) {
    _profilePictureController = value;
    notifyListeners();
  }

  TextEditingController _workerIdPictureController = TextEditingController();
  TextEditingController get workerIdPictureController =>
      _workerIdPictureController;
  set workerIdPictureController(TextEditingController value) {
    _workerIdPictureController = value;
    notifyListeners();
  }

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
