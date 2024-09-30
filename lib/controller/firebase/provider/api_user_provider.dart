import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/api_users_model.dart';
import '../services/api_users_services.dart';

class ApiUserProvider with ChangeNotifier {
  final ApiUsersService _apiUserService = ApiUsersService();

  List<ApiUserModel> _users = [];
  List<ApiUserModel> get users => _users;

  ApiUserModel _user = ApiUserModel();
  ApiUserModel get user => _user;

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

  Future<void> fetchUsers() async {
    _users = await _apiUserService.fetchUser();
    notifyListeners();
  }

  Future<void> addUser(ApiUserModel model) async {
    await _apiUserService.createUser(model);
    notifyListeners();
  }

  Future<void> updateUser(int id, ApiUserModel model) async {
    await _apiUserService.updateUser(id, model);
    notifyListeners();
  }

  Future<void> deleteUser(int userId) async {
    await _apiUserService.deleteUser(userId);
    notifyListeners();
  }

  void getUsersStreamById(userId) async {
    _user = await _apiUserService.fetchUserById(userId);
    notifyListeners();
  }

  Future<void> sendUserToApi(BuildContext context) async {
    try {
      final fUserProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);

      fUserProvider.fetchUsers();

      for (var i in fUserProvider.users) {
        ApiUserModel apiUser = ApiUserModel(
            firebaseUid: i.firebaseUid,
            username: i.username,
            email: i.email,
            phone: i.phone,
            location: i.location,
            role: i.role,
            skills: i.serviceName,
            profilePic: i.profilePic,
            workerIdPicture: i.workerIdPicture);
        return await addUser(apiUser);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
