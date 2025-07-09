import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/wishlist_model.dart';

class WishlistViewModel extends StateNotifier<List<WishlistModel>> {
  WishlistViewModel()
    : super([
        WishlistModel(
          id: '1',
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: "M",
        ),

        WishlistModel(
          id: '2',
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: "M",
        ),

        WishlistModel(
          id: '3',
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: "M",
        ),
      ]);

  void removedProduct(int index) {
    final updated = [...state]..removeAt(index);
    state = updated;
  }
}

final wishlistProvider =
    StateNotifierProvider<WishlistViewModel, List<WishlistModel>>((ref) {
      return WishlistViewModel();
    });
