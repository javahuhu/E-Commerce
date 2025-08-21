import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commercehybrid/Model/product_model.dart';

class RecentlyviewViewModel extends StateNotifier<List<Product>> {
  RecentlyviewViewModel() : super([]);

  void addtoViewed(Product product) {
    if (!state.contains(product) && !state.any((p) => p.id == product.id)) {
      state = [...state, product];
    }

    if (state.length > 10) {
      state = state.sublist(0, 10);
    }
  }
}

final recentlyviewProvider =
    StateNotifierProvider<RecentlyviewViewModel, List<Product>>((ref) {
      return RecentlyviewViewModel();
    });
