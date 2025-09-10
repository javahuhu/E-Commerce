import 'package:e_commercehybrid/Model/review_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewViewModel extends StateNotifier<Map<String, ReviewModel>> {
  ReviewViewModel() : super({});

  ReviewModel? getReview(String id) => state[id];

  void updateRating(String id, double rating) {
    final current = state[id];

    if (current != null) {
      state = {...state, id: current.copyWith(rates: rating)};
    } else {
      state = {...state, id: ReviewModel(id: id, comment: '', rates: 0)};
    }
  }

  void updateComment(String id, String comment) {
    final current = state[id];
    if (current != null) {
      state = {...state, id: current.copyWith(comment: comment)};
    } else {
      state = {...state, id: ReviewModel(id: id, comment: '', rates: 0)};
    }
  }
}

final reviewProvider =
    StateNotifierProvider<ReviewViewModel, Map<String, ReviewModel>>((ref) {
      return ReviewViewModel();
    });
