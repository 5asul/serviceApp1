import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_for_all/models/users_model.dart';

class FirebaseUserServices {
  final CollectionReference _userRefernce =
      FirebaseFirestore.instance.collection('users');

  Stream<List<UserModel>> getUsersStream() {
    return _userRefernce.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }
  Stream<List<UserModel>> getUsersStreamById(String userId) {
    return _userRefernce.snapshots().map((snapshot) {
      return snapshot.docs.where((userid)=> 'id' == userid)
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> addUser(UserModel user) async {
    await _userRefernce.doc(user.id).set(user.toJson());
  }
  
  Future<void> updateUser(UserModel user) async {
    await _userRefernce.doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await _userRefernce.doc(userId).delete();
  }
}
