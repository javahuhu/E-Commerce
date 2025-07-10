class RecommendationModel {
  final String id;
  final List<String> image;
  final List<String>subimage;
  final String title;
  final String price;
  final List<String> material;
  final String origin;
  final int rating;
 final List<String> size;
  final String color;

  RecommendationModel({
    required this.id,
    required this.image,
    required this.subimage,
    required this.title,
    required this.price,
    required this.material,
    required this.origin,
    required this.rating,
    required this.size,
    required this.color,
  });
}
