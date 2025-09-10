class ReviewModel {
  final String id;
  final String comment;
  final double rates;

  ReviewModel({required this.id, required this.comment, required this.rates});

  ReviewModel copyWith({double? rates, String? comment}) {
    return ReviewModel(
      id: id,
      comment: comment ?? this.comment,
      rates: rates ?? this.rates,
    );
  }
}
