import 'dart:ffi';

class ApiReviewsModel {
  Int? id;
  String? reviewId;
  String? requestId;
  double? rating;
  String? comment;
  String? timeStamp;
  int? likes;
  

  ApiReviewsModel({
    this.id,
    this.requestId,
    this.rating,
    this.comment,
    this.timeStamp,
    this.likes,
  });

  ApiReviewsModel.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    reviewId = json["ReviewId"];
    requestId = json["RequestId"];
    rating = json["Rating"];
    comment = json["Comment"];
    timeStamp = json["TimeStamp"];
    likes = json["Likes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Id"] = this.id;
    _data["ReviewId"] = this.reviewId;
    _data["RequestId"] = this.requestId;
    _data["Rating"] = this.rating;
    _data["Comment"] = this.comment;
    _data["TimeStamp"] = this.timeStamp;
    _data["Likes"] = this.likes;
    return _data;
  }
}
