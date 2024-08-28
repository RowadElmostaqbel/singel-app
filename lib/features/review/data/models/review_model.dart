class ReviewModel {
  final int id;
  final String? comment;
  final dynamic rate;
  final String createdAt;
  final String name;
  final String image;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rate,
    required this.createdAt,
    required this.name,
    required this.image,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      rate: json['rate'],
      createdAt: json['created_at'],
      name: json['client']['name'],
      image: json['client']['image'],
    );
  }
}
