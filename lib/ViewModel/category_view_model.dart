import 'package:e_commercehybrid/Model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryViewModel extends StateNotifier<List<CategoryModel>> {
  CategoryViewModel()
    : super([
        CategoryModel(
          id: '1',
          image: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          category: 'Shoes',
          noItems: '109',
        ),

        CategoryModel(
          id: '1',
          image: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          category: 'Shoes',
          noItems: '109',
        ),

        CategoryModel(
          id: '1',
          image: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          category: 'Shoes',
          noItems: '109',
        ),

        CategoryModel(
          id: '1',
          image: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          category: 'Shoes',
          noItems: '109',
        ),
      ]);
}

final categoryProvider =
    StateNotifierProvider<CategoryViewModel, List<CategoryModel>>((ref) {
      return CategoryViewModel();
    });
