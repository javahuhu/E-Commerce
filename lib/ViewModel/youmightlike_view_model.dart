import 'package:e_commercehybrid/Model/youmightlike_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YoumightlikeViewModel extends StateNotifier<List<YoumightlikeModel>> {
  YoumightlikeViewModel()
    : super([
        YoumightlikeModel(
          id: '1',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Lorem ipsum dolor sit amet consectetur',
          price: '₱250',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        YoumightlikeModel(
          id: '2',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Lorem ipsum dolor sit amet consectetur',
          price: '₱250',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        YoumightlikeModel(
          id: '3',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Lorem ipsum dolor sit amet consectetur',
          price: '₱250',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S",],
          color: 'Green',
        ),

        YoumightlikeModel(
          id: '4',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Lorem ipsum dolor sit amet consectetur',
          price: '₱250',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S",],
          color: 'Green',
        ),
      ]);
}

final youmightlikeProvider =
    StateNotifierProvider<YoumightlikeViewModel, List<YoumightlikeModel>>((
      ref,
    ) {
      return YoumightlikeViewModel();
    });
