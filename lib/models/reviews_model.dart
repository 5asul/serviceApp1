class ReviewsModel {
  String? reviewId;
  String? requestId;
  double? rating;
  String? comment;
  String? timeStamp;
  int? likes;
   String? docid;

  ReviewsModel(
      {this.reviewId,
      this.requestId,
      this.rating,
      this.comment,
      this.timeStamp,
      this.likes,
      this.docid});

  ReviewsModel.fromJson(Map<String, dynamic> json, String docid) {
    reviewId = json["reviewId"];
    requestId = json["requestId"];
    rating = json["rating"];
    comment = json["comment"];
    timeStamp = json["timeStamp"];
    likes = json["likes"];
    this.docid = docid;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reviewId"] = reviewId;
    _data["requestId"] = requestId;
    _data["rating"] = rating;
    _data["comment"] = comment;
    _data["timeStamp"] = timeStamp;
    _data["likes"] = likes;
    return _data;
  }
}
