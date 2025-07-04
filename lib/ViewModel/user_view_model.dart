import '../Model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Create Account View Model
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

//Log In View Model
class LoginRequestModel extends StateNotifier<LoginRequest> {
  LoginRequestModel() : super(LoginRequest(username: '', password: ''));

  void updateLoginUsername(String value) {
    state = state.copyWith(username: value);
  }

  void updateLoginPassword(String value) {
    state = state.copyWith(password: value);
  }

}

  final userLoginProvider =
      StateNotifierProvider<LoginRequestModel, LoginRequest>((ref) {
        return LoginRequestModel();
      });




//Change Password  View Model
class ChangePasswordModel extends StateNotifier<ChangePassword> {
  ChangePasswordModel()
    : super(ChangePassword(changepassword: '', confirmchangepassword: ''));

  void updateChangePassword(String value) {
    state = state.copyWith(changepassword: value);
  }

  void updateConfirmChangePassword(String value) {
    state = state.copyWith(confirmchangepassword: value);
  }
}

 final userChangePasswordProvider = StateNotifierProvider<ChangePasswordModel, ChangePassword>((ref){
        return ChangePasswordModel();
  });
