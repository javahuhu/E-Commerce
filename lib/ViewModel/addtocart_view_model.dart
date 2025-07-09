import 'package:e_commercehybrid/Model/addtocart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddtocartViewModel extends StateNotifier<List<AddtocartModel>> {
  AddtocartViewModel()
    : super([
        AddtocartModel(
          id: "1",
          image: "assets/sampleitem.jpeg",
          title: "'Lorem ipsum dolor sit amet consectetur.'",
          color: 'Purple',
          size: 'Size M',
          price: "\$32.50",
        ),

        AddtocartModel(
          id: "2",
          image: "assets/sampleitem.jpeg",
          title: "'Lorem ipsum dolor sit amet consectetur.'",
          color: 'Purple',
          size: 'Size M',
          price: "\$32.50",
        ),

        AddtocartModel(
          id: "3",
          image: "assets/sampleitem.jpeg",
          title: "'Lorem ipsum dolor sit amet consectetur.'",
          color: 'Purple',
          size: 'Size M',
          price: "\$32.50",
        ),

        AddtocartModel(
          id: "4",
          image: "assets/sampleitem.jpeg",
          title: "'Lorem ipsum dolor sit amet consectetur.'",
          color: 'Purple',
          size: 'Size M',
          price: "\$32.50",
        ),
      ]);

  void onDelete(int index) {
    final update = [...state]..removeAt(index);
    state = update;
  }
}

final addtocartProvider =
    StateNotifierProvider<AddtocartViewModel, List<AddtocartModel>>((ref) {
      return AddtocartViewModel();
    });
