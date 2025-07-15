enum ProductModel {
      newItem,
      recommended,
      popular,
      recentView,
      youmightlike,
      categories
}

      class Product {
            final String id;
            final List<String> image;
            final List<String> subimage;
            final String title;
            final List<String> material;
            final String origin;
            final String price;
            final List<String> size;
            final String color;
            final ProductModel? type;
            final int? likes;
            final String? event;
            final int? rating;
            final String? category;
            final int? noItems;

            Product ({
              required this.id,
              required this.image,
              required this.subimage,
              required this. title,
              required this.material,
              required this.origin,
              required this.price,
              required this.size,
              required this.color,
              this.type,
              this.likes,
              this.event,
              this.rating,
              this.category,
              this.noItems
            });
      } 