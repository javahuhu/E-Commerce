enum ProductModel {
      newItem,
      recommended,
      popular,
      recentView,
      youmightlike,
      categories,
      flashsale
}

      class Product {
            final String id;
            final String? mainimage;
            final List<String> image;
            final List<String> subimage;
            final String title;
            final List<String> material;
            final String origin;
            final String price;
            final String? discount;
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
              this.mainimage,
              required this.image,
              required this.subimage,
              required this. title,
              required this.material,
              required this.origin,
              required this.price,
              this.discount,
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