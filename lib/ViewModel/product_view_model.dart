import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductViewModel extends StateNotifier<List<Product>> {
  ProductViewModel()
    : super([
        //newItem//
        Product(
          id: '1',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.newItem,
        ),

        Product(
          id: '2',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.newItem,
        ),

        Product(
          id: '3',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.newItem,
        ),

        Product(
          id: '4',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.newItem,
        ),

        //Popular//
        Product(
          id: '1',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.popular,
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '2',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.popular,
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '3',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.popular,
          likes: 1700,
          event: 'Sale',
        ),

        Product(
          id: '4',
          image: ["assets/sampleitem2.jpeg", "assets/sampleitem2.jpeg"],
          subimage: [
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
            "assets/sampleitem2.jpeg",
          ],
          title:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
          material: ["Cotton", "Nylon"],
          origin: 'PH',
          price: '\$18.00',
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.popular,
          likes: 1700,
          event: 'Sale',
        ),


        //For you//
        Product(
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 5,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.recommended,
        ),

        Product(
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 2,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.recommended,
        ),

        Product(
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.recommended,
        ),

        Product(
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 4,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.recommended,
        ),

        //Categories//
        Product(
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 5,
          size: ["M", "L", "S"],
          color: 'Green',
          category: 'Sandals',
          noItems: 109,
          type: ProductModel.categories,
        ),

        Product(
          id: '2',
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 2,
          size: ["M", "L", "S"],
          color: 'Green',
          category: 'T-Shirt',
          noItems: 109,
          type: ProductModel.categories,
        ),

        Product(
          id: '3',
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S"],
          color: 'Green',
          category: 'Slippers',
          noItems: 109,
          type: ProductModel.categories,
        ),

        Product(
          id: '4',
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
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 4,
          size: ["M", "L", "S"],
          color: 'Green',
          category: 'Dress',
          noItems: 109,
          type: ProductModel.categories,
        ),

        Product(
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
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.youmightlike,
        ),

        Product(
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
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.youmightlike,
        ),

        Product(
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
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.youmightlike,
        ),

        Product(
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
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.youmightlike,
        ),

        Product(
          id: '41',
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
          discount: '₱50',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 5,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.flashsale,
        ),

        Product(
          id: '42',
          image: ['assets/sampleitem2.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          discount: '₱50',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 2,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.flashsale,
        ),

        Product(
          id: '43',
          image: ['assets/sampleitem3.jpeg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          discount: '₱50',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 3,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.flashsale,
        ),

        Product(
          id: '44',
          image: ['assets/sampleitem4.jpg'],
          subimage: [
            'assets/sampleitem.jpeg',
            'assets/sampleitem2.jpeg',
            'assets/sampleitem3.jpeg',
            'assets/sampleitem4.jpg',
          ],
          title: 'Soft Violet Everyday Shirt',
          price: '₱250',
          discount: '₱50',
          material: ["Cotton", "Nylon"],
          origin: "EU",
          rating: 4,
          size: ["M", "L", "S"],
          color: 'Green',
          type: ProductModel.flashsale,
        ),
      ]);
}

final productsProvider = StateNotifierProvider<ProductViewModel, List<Product>>(
  (ref) {
    return ProductViewModel();
  },
);

final newItemsProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems.where((item) => item.type == ProductModel.newItem).toList();
});

final popularItemsProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems.where((item) => item.type == ProductModel.popular).toList();
});



final recommendationProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems
      .where((items) => items.type == ProductModel.recommended)
      .toList();
});

final categoryProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems
      .where((items) => items.type == ProductModel.categories)
      .toList();
});

final youmightlikeProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems
      .where((item) => item.type == ProductModel.youmightlike)
      .toList();
});

final flashsaleProvider = Provider<List<Product>>((ref) {
  final allItems = ref.watch(productsProvider);
  return allItems
      .where((items) => items.type == ProductModel.flashsale)
      .toList();
});
