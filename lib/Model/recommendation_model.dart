class RecommendationModel {
  final String id;
  final List<String> image;
  final List<String>subimage;
  final String title;
  final String price;
  final int rating;

  RecommendationModel({
    required this.id,
    required this.image,
    required this.subimage,
    required this.title,
    required this.price,
    required this.rating,
  });
}
