import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_for_all/models/users_model.dart';

class FirebaseUserServices {
  final CollectionReference _userRefernce =
      FirebaseFirestore.instance.collection('users');

  Stream<List<UserModel>> getUsersStream() {
    return _userRefernce.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Stream<List<UserModel>> getUsersStreamById(String userId) {
    return _userRefernce.snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc['firebaseUid'] == userId)
          .map((doc) =>
              UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<void> addUser(UserModel user) async {
    await _userRefernce
       .add(user.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUser(UserModel user) async {
    await _userRefernce
        .doc(user.firebaseUid)
        .update(user.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to Update user: $error"));
  }

  Future<void> deleteUser(String userId) async {
    await _userRefernce
        .doc(userId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to Delete user: $error"));
  }
}
