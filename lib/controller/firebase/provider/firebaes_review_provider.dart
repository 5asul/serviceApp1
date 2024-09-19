import 'package:flutter/material.dart';
import 'package:project_for_all/models/reviews_model.dart';

import '../../../models/requests_model.dart';
import '../services/firebase_requests_services.dart';
import '../services/firebase_reviews_services.dart';

class FirebaseReviewProvider with ChangeNotifier {
  final FirebaseReviewsServices _requestsServices = FirebaseReviewsServices();



  List<ReviewsModel> _requests = [];
  List<ReviewsModel> get requests => _requests;

  ReviewsModel _request = ReviewsModel();
  ReviewsModel get request => _request;

  void fetchRequests() {
    _requestsServices.getReviewsStream().listen((ReviewsModel) {
      _requests = ReviewsModel;
      notifyListeners();
    });
  }

  void addRequest(ReviewsModel model) async {
    await _requestsServices.addReview(model);
    notifyListeners();
  }

  void updateRequest(ReviewsModel model) async {
    _requestsServices.updateReview(model);
    notifyListeners();
  }

  void deleteRequest(String reviewId) async {
    await _requestsServices.deleteReview(reviewId);
    notifyListeners();
  }

  void getRequestsStreamById(requestId) {
    _requestsServices.getReviewsStreamById(requestId).listen((RequestsModel) {
      _request = RequestsModel[0];
      notifyListeners();
    });
  }
}
