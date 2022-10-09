// import 'dart:convert';
// import 'package:kejani/model/User.dart';
// import 'package:http/http.dart';
//
// class UserApiService {
//   // final Dio _dio = Dio();
//   final String apiUrl = 'http://localhost:8090/api/v1/user/register';
//
//   //CreateUser
//   Future<User> createUser(User user) async {
//     Map data = {
//       'user_email': user.user_email,
//       'user_phone': user.user_phone,
//       'user_password': user.user_password,
//       'user_name': user.user_name
//     };
//     final Response response = await post(
//       apiUrl,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(data),
//     );
//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to post cases');
//     }
//   }
//
//   post(String apiUrl,
//       {required Map<String, String> headers, required String body}) {}
//
//   //get user profile
// }
