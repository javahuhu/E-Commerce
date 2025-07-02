import '../Model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends StateNotifier<User> {
  UserViewModel()
    : super(User(username: '', password: '', confirmpassword: '', email: ''));

  void updateUsername(String value) {
    state = state.copyWith(username: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmpassword(String value) {
    state = state.copyWith(confirmpassword: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }
}

final userProvider = StateNotifierProvider<UserViewModel, User>((ref) {
  return UserViewModel();
});
