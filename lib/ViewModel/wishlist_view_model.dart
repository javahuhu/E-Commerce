import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistViewModel extends StateNotifier<List<Product>> {
  WishlistViewModel() : super([]);

  bool inWishlist(String id) {
    return state.any((product) => product.id == id);
  }

  void addtoWishlist(Product product) {
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  void removetoWishlist(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void remove(int index) {
    final update = [...state]..removeAt(index);
    state = update;
  }
}

final wishlistProvider =
    StateNotifierProvider<WishlistViewModel, List<Product>>((ref) {
      return WishlistViewModel();
    });
