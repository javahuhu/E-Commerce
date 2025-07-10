import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/newitem_model.dart';

class NewitemViewModel extends StateNotifier<List<NewitemModel>> {
  NewitemViewModel()
    : super([
        NewitemModel(
          id: '1',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        NewitemModel(
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
          price: '\$17.00',
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        NewitemModel(
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
          price: '\$17.00',
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        NewitemModel(
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
          price: '\$17.00',
          size: ["M", "L", "S",],
          color: 'Green',
        ),
      ]);
}

final newitemProvider =
    StateNotifierProvider<NewitemViewModel, List<NewitemModel>>((ref) {
      return NewitemViewModel();
    });
