class User{
  final String user_email;
  final String user_id;
  final int user_phone;
  final String user_password;
  final String user_name;

  User({
    required this.user_email,
    required this.user_id,
    required this.user_phone,
    required this.user_password,
    required this.user_name
  });
factory User.fromMap(Map userMap){
  return User(
    user_email: userMap['user_email'],
    user_id: userMap['user_id'],
    user_phone: userMap['user_phone'],
    user_password: userMap['user_password'],
    user_name: userMap['user_name'],
  );
}

  void add(Type user) {

  }


}