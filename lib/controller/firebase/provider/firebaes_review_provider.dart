import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_for_all/models/reviews_model.dart';

import '../services/firebase_reviews_services.dart';

class FirebaseReviewProvider with ChangeNotifier {
  final FirebaseReviewsServices _reviewsServices = FirebaseReviewsServices();

  List<File> _selectedImages = [];
  List<File> get selectedImages => _selectedImages;
  set selectedImages(List<File> images) {
    _selectedImages = images;
    notifyListeners();
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    notifyListeners();
  }

  String _comment = '';
  String get comment => _comment;
  set comment(String value) {
    _comment = value;
    notifyListeners();
  }

  double _ratingValue = 0;
  double get ratingValue => _ratingValue;
  set ratingValue(double value) {
    _ratingValue = value;
    notifyListeners();
  }

  String _requestId = '';
  String get requestId => _requestId;
  set requestId(String value) {
    _requestId = value;
    notifyListeners();
  }

  String _workerId = '';
  String get workerId => _workerId;
  set workerId(String value) {
    _workerId = value;
    notifyListeners();
  }
  
  List<ReviewsModel> _reviews = [];
  List<ReviewsModel> get reviews => _reviews;

  ReviewsModel _review = ReviewsModel();
  ReviewsModel get review => _review;

  void fetchRequests() {
    _reviewsServices.getReviewsStream().listen((ReviewsModel) {
      _reviews = ReviewsModel;
      notifyListeners();
    });
  }

  void addReview(ReviewsModel model) async {
    await _reviewsServices.addReview(model);
    notifyListeners();
  }

  void updateReview(ReviewsModel model) async {
    _reviewsServices.updateReview(model);
    notifyListeners();
  }

  void deleteReview(String reviewId) async {
    await _reviewsServices.deleteReview(reviewId);
    notifyListeners();
  }

  void getReviewsStreamById(reviewId) {
    _reviewsServices.getReviewsStreamById(reviewId).listen((ReviewsModel) {
      _reviews = ReviewsModel;
      notifyListeners();
    });
  }
}
