import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../models/reviews_model.dart';

class FirebaseReviewsServices {
  final CollectionReference _reviewsReference =
      FirebaseFirestore.instance.collection('reviews');

  Stream<List<ReviewsModel>> getReviewsStream() {
    return _reviewsReference.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ReviewsModel.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Stream<List<ReviewsModel>> getReviewsStreamById(String requestId) {
    return _reviewsReference.snapshots().map((snapshot) {
      return snapshot.docs
          .where((requestId) => 'reviewId' == requestId)
          .map((doc) => ReviewsModel.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<void> addReview(ReviewsModel review) async {
    await _reviewsReference
        .add(review.toJson())
        .then((value) => print("Review Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateReview(ReviewsModel review) async {
    await _reviewsReference
        .doc(review.docid)
        .update(review.toJson())
        .then((value) => print("Review Updated"))
        .catchError((error) => print("Failed to update review: $error"));
  }

  Future<void> deleteReview(String docId) async {
    await _reviewsReference
        .doc(docId)
        .delete()
        .then((value) => print("Review Deleted"))
        .catchError((error) => print("Failed to Delete review: $error"));
  }
}
