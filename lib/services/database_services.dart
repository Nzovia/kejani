
import 'dart:convert';
import 'package:kejani/model/User.dart';
import 'package:kejani/services/user_service.dart';
import 'package:http/http.dart'as http;
class DatabaseServices{

static Future<Type> addUser(String userEmail)async{

  Set<String> data ={
    userEmail= userEmail,
  };
  var body = json.encode(data);
  var url=Uri.parse(baseURL + '/add');
  http.Response response = await http.post(
  url,
    headers: headers,
    body: body,
  );
  print(response.body);
  Map responseMap=jsonDecode(response.body);
  User user= User.fromMap((responseMap));
  return User;
}
static Future<Type> getUser()async{
  var url =Uri.parse(baseURL);
  http.Response response = await http.get(
      url,
    headers:headers,
  );
  print(response.body);
  List responseList=jsonDecode(response.body);
  List<User> user =[];
 for(Map userMap in responseList){
   User user = User.fromMap(userMap);
   user.add(User);
 }
  return User;

}
}