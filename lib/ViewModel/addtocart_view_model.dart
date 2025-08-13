import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddtocartViewModel extends StateNotifier<List<Product>> {
  AddtocartViewModel() : super([]);

  void addtoCart(Product product) {
    if (!state.contains(product) && !state.any((p) => p.id == product.id)) {
      state = [...state, product];
      
    }
  }

  void onDelete(int index) {
    final update = [...state]..removeAt(index);
    state = update;
  }
}

final addtocartProvider =
    StateNotifierProvider<AddtocartViewModel, List<Product>>((ref) {
      return AddtocartViewModel();
    });
