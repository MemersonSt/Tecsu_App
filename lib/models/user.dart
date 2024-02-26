class LoginModel {
  late String username;
  late String password;

  LoginModel({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
