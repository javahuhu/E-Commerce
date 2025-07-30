import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistViewModel extends StateNotifier<List<Product>> {
  WishlistViewModel()
    : super([
        //Wishlist//
        Product(
          id: '25',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: "\$17.00",
          color: "Pink",
          size: ["M", "L", "S"],
        ),

        Product(
          id: '26',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: ["M", "L", "S"],
        ),

        Product(
          id: '27',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: ["M", "L", "S"],
        ),
      ]);

  void removetoCart(String id) {
      state = state.where((item) => item.id !=id).toList();
  }

  void remove(int index){
    final update = [...state]..removeAt(index);
    state = update;
  }
}

final wishlistProvider =
    StateNotifierProvider<WishlistViewModel, List<Product>>((ref) {
      return WishlistViewModel();
    });
