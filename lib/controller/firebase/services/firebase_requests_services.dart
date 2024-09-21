import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/requests_model.dart';

class FirebaseRequestsServices {
  final CollectionReference _requestsReference =
      FirebaseFirestore.instance.collection('requests');

  Stream<List<RequestsModel>> getRequestsStream() {
    return _requestsReference.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => RequestsModel.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Stream<List<RequestsModel>> getRequestsStreamById(String userId) {
    return _requestsReference.snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc['clientId'] == userId)
          .map((doc) => RequestsModel.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Stream<List<RequestsModel>> getWorkerRequestsStreamById(String userId) {
    return _requestsReference.snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc['workerId'] == userId)
          .map((doc) => RequestsModel.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<void> addRequest(RequestsModel request) async {
    
    await _requestsReference
        .add(request.toJson())
        .then((value) => print("Request Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateRequest(RequestsModel request) async {
    await _requestsReference
        .doc(request.docid)
        .update(request.toJson())
        .then((value) => print("Request Updated"))
        .catchError((error) => print("Failed to update request: $error"));
  }

  Future<void> deleteRequest(String docId) async {
    await _requestsReference
        .doc(docId)
        .delete()
        .then((value) => print("Request Deleted"))
        .catchError((error) => print("Failed to Delete request: $error"));
  }
}
