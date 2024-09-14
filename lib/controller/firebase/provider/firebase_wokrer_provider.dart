
import 'package:flutter/material.dart';

import '../../../models/worker_model.dart';
import '../services/firebase_worker_services.dart';

class FirebaseWorkerProvider with ChangeNotifier {
  final FirebaseWorkerServices _workerService = FirebaseWorkerServices();

  

  List<WorkerModel> _workers = [];
  WorkerModel _worker = WorkerModel();
  List<WorkerModel> get workers => _workers;
  WorkerModel get user => _worker;

  

  void fetchWorkers() {
    _workerService.getWorkersStream().listen((WorkerModel) {
      _workers = WorkerModel;
      notifyListeners();
    });
  }

  void addWorker(WorkerModel model) async {
    await _workerService.addWorker(model);
    notifyListeners();
  }

  void updateWorker(WorkerModel model) async {
    await _workerService.updateWorker(model);
    notifyListeners();
  }

  void deleteUser(String  workerId) async {
    await _workerService.deleteWorker(workerId);
    notifyListeners();
  }

  void getUsersStreamById(workerId) {
    _workerService.getWorkersStreamById(workerId).listen((WorkerModel) {
      _worker = WorkerModel[0];
      notifyListeners();
    });
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
