import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commercehybrid/Model/user_card_model.dart';

class UsercardViewModel extends StateNotifier<List<UserCard>> {
  UsercardViewModel() : super([]);


  void thecardupdated(UserCard latestcard, int index){
        final latest = [...state];
        latest[index] = latestcard;
        state = latest;
  }

  void updateCardHolder(String value, int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(cardholder: value);
    state = updated;
  }

  void updateCardNumber(String value, int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(cardnumber: value);
    state = updated;
  }

  void updateExpiry(String value, int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(expiredate: value);
    state = updated;
  }

  void updateCVV(String value, int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(cvv: value);
    state = updated;
  }

  void addCard(UserCard card) {
    state = [...state, card];
  }


  void removeCard(int index) {
    final updatethelist = [...state];
    updatethelist.removeAt(index);
    state = updatethelist;
  }


}

final userCardProvider =
    StateNotifierProvider<UsercardViewModel, List<UserCard>>((ref) {
      return UsercardViewModel();
    });
