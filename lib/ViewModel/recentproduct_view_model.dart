import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/recentproduct_model.dart';

class RecentproductViewModel extends StateNotifier<List<RecentproductModel>>{
      RecentproductViewModel() : super([

        RecentproductModel(
          id: '1',
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: "M",
        ),
        RecentproductModel(
          id: '1',
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
          price: "\$17.00",
          color: "Pink",
          size: "M",
        )
          
      ]);
}

final recentproductProvider = StateNotifierProvider<RecentproductViewModel, List<RecentproductModel>> ((ref){
      return RecentproductViewModel();
});