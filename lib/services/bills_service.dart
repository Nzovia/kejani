import 'dart:convert';
import 'package:kejani/model/bills.dart';
import 'package:http/http.dart' as http;

class BillApiService {
  final String apiUrl = "http://192.168.43.94:8090/api/v1/bills";

  Future<List<Bill>> getBills() async {
    var res = await http.get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Bill> bills =
          body.map((dynamic item) => Bill.fromJson(item)).toList();
      return bills;
    } else {
      throw "Failed to load cases list";
    }
  }
}
