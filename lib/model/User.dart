class User {
  final String user_email;
  final String user_phone;
  final String user_password;
  final String user_name;

  User(
      {required this.user_email,
      required this.user_phone,
      required this.user_password,
      required this.user_name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        user_email: json['user_email'] as String,
        user_phone: json['user_phone'] as String,
        user_password: json['user_password'] as String,
        user_name: json['user_name'] as String);
  }

  @override
  String toString() {
    return 'User{user_email: $user_email, user_phone: $user_phone, user_password: $user_password, user_name: $user_name}';
  }
}
