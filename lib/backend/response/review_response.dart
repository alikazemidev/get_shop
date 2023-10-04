import 'package:get_shop/backend/models/review.dart';

class ReviewResponse {
  List<Review>? reviewData;

  ReviewResponse({this.reviewData});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      reviewData = <Review>[];
      json['data'].forEach((v) {
        reviewData!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviewData != null) {
      data['data'] = this.reviewData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
