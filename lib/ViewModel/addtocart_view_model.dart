import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddtocartViewModel extends StateNotifier<List<Product>> {
  AddtocartViewModel()
    : super([
        Product(
          id: '1',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '2',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '3',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '4',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          likes: 1700,
          event: 'Sale',
        ),
      ]);

  void onDelete(int index) {
    final update = [...state]..removeAt(index);
    state = update;
  }
}

final addtocartProvider =
    StateNotifierProvider<AddtocartViewModel, List<Product>>((ref) {
      return AddtocartViewModel();
    });
