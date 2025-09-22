import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commercehybrid/Model/product_model.dart';

class SelectproductModel {
  final String id;
  final String mainimage;
  final List<String> image;
  final List<String> subimage;
  final String title;
  final String price;
  final List<String> material;
  final String origin;
  final List<String> size;
  final String selectedSize;
  final String color;

  SelectproductModel({
    required this.id,
    required this.mainimage,
    required this.image,
    required this.subimage,
    required this.title,
    required this.price,
    required this.material,
    required this.origin,
    required this.size,
    required this.selectedSize,
    required this.color,
  });

  

  Product toProduct() {
    return Product(
      id: id,
      mainimage: mainimage,
      image: image,
      subimage: subimage,
      title: title,
      price: price,
      material: material,
      origin: origin,
      size: size,
      selectedSize: selectedSize,
      color: color,
    );
  }

  SelectproductModel copyWith({String? mainimage, String? selectedSize}){
    return SelectproductModel(
      id: id, 
      mainimage: mainimage ?? this.mainimage, 
      image: image, 
      subimage: subimage, 
      title: title, 
      price: price, 
      material: material, 
      origin: origin, 
      size: size,
      selectedSize: selectedSize ?? this.selectedSize, 
      color: color);
  }
}

final selectedproductProvider = StateProvider<SelectproductModel?>(
  (ref) => null,
);
