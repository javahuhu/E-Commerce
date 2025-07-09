import 'package:e_commercehybrid/Model/popularproduct_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularproductViewModel extends StateNotifier<List<PopularproductModel>> {
  PopularproductViewModel()
    : super([
        PopularproductModel(
          image: "assets/sampleitem2.jpeg",
          like: "1700",
          status: "sale",
        ),

        PopularproductModel(
          image: "assets/sampleitem2.jpeg",
          like: "1700",
          status: "sale",
        ),

        PopularproductModel(
          image: "assets/sampleitem2.jpeg",
          like: "1700",
          status: "sale",
        ),

        PopularproductModel(
          image: "assets/sampleitem2.jpeg",
          like: "1700",
          status: "sale",
        ),
      ]);
}

final popularproductProvider =
    StateNotifierProvider<PopularproductViewModel, List<PopularproductModel>>((
      ref,
    ) {
      return PopularproductViewModel();
    });
