import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_for_all/models/users_model.dart';

import '../../../models/worker_model.dart';

class FirebaseWorkerServices {
  final CollectionReference _workerRefernce =
      FirebaseFirestore.instance.collection('workers');

  Stream<List<WorkerModel>> getWorkersStream() {
    return _workerRefernce.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => WorkerModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Stream<List<WorkerModel>> getWorkersStreamById(String workerId) {
    return _workerRefernce.snapshots().map((snapshot) {
      return snapshot.docs
          .where((workerId) => 'firbaseUid' == workerId)
          .map((doc) => WorkerModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addWorker(WorkerModel worker) async {
    await _workerRefernce
        .doc(worker.firebaseUid)
        .set(worker.toJson())
        .then((value) => print("Worker Added"))
        .catchError((error) => print("Failed to add Worker: $error"));
  }

  Future<void> updateWorker(WorkerModel worker) async {
    await _workerRefernce
        .doc(worker.firebaseUid)
        .update(worker.toJson())
        .then((value) => print("Worker Updated"))
        .catchError((error) => print("Failed to Update worker: $error"));
  }

  Future<void> deleteWorker(String workerId) async {
    await _workerRefernce
        .doc(workerId)
        .delete()
        .then((value) => print("Worker Deleted"))
        .catchError((error) => print("Failed to Delete worker: $error"));
  }
}
