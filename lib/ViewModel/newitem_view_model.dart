import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/newitem_model.dart';

class NewitemViewModel extends StateNotifier<List<NewitemModel>> {
  NewitemViewModel()
    : super([
        NewitemModel(
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
        ),

        NewitemModel(
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
        ),

        NewitemModel(
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
        ),

        NewitemModel(
          image: "assets/sampleitem2.jpeg",
          title: "Lorem ipsum dolor sit amet consectetur.",
        ),
      ]);
}

final newitemProvider = StateNotifierProvider<NewitemViewModel, List<NewitemModel>> ((ref){
      return NewitemViewModel();
});