class CancelReasonModel {
  final String? reason;
  final int? id;

  CancelReasonModel({
     this.reason,
     this.id,
  });

  factory CancelReasonModel.fromJson(Map<String, dynamic> json) {
    return CancelReasonModel(
      reason: json['reason'],
      id: json['id'],
    );
  }
}
