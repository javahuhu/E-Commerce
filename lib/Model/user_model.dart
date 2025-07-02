class User {
  final String username;
  final String password;
  final String email;
  final String confirmpassword;

  User({
    required this.username,
    required this.password,
    required this.confirmpassword,
    required this.email,
  });

  User copyWith({
    String? username,
    String? password,
    String? email,
    String? confirmpassword,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }
}

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  LoginRequest copyWith({String? username, String? password}) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

