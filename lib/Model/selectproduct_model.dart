import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectproductModel {
    final String id;
    final List<String> image;
    final List<String> subimage;
    final String title;
    final String price;
    final List<String> material;
    final String origin;
    final List<String> size;
    final String color;
   

    SelectproductModel({
      required this.id,
      required this.image,
      required this.subimage,
      required this.title,
      required this.price,
      required this.material,
      required this.origin,
      required this.size,
      required this.color
      
    });

}

final selectedproductProvider = StateProvider<SelectproductModel?>((ref) => null);