class AddReviewDataModel {
  int? itemId;
  String? comment;
  double? rate;

  AddReviewDataModel({this.itemId, this.comment, this.rate});


  AddReviewDataModel copyWith({int? itemId, String? comment, double? rate}) {
    return AddReviewDataModel(
      itemId: itemId ?? this.itemId,
      comment: comment ?? this.comment,
      rate: rate ?? this.rate,
    );
  }

  toJson(){
    return {
      'item_id': itemId,
      'comment': comment,
      'rate': rate,
  };
  }
}
