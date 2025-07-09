import 'package:e_commercehybrid/Model/recommendation_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendationViewModel extends StateNotifier<List<RecommendationModel>> {
  RecommendationViewModel()
    : super([
        RecommendationModel(
          id: '1',
          image: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],

          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          rating: 5,
        ),

        RecommendationModel(
          id: '2',
          image: ['assets/sampleitem2.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          rating: 2,
        ),

        RecommendationModel(
          id: '3',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          rating: 3,
        ),

        RecommendationModel(
          id: '4',
          image: ['assets/sampleitem4.jpg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          rating: 4,
        ),
      ]);
}

final recommendationProvider =
    StateNotifierProvider<RecommendationViewModel, List<RecommendationModel>>((
      ref,
    ) {
      return RecommendationViewModel();
    });

final selectedimageProvider = StateProvider<List<String>>((ref) => []);
final selectedsubimageProvider = StateProvider<List<String>> ((ref) => []);
