import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final endPoint = "https://www.hpb.health.gov.lk/api/get-current-statistical";

  Future<Map<String, dynamic>> getData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> data = body['data'];
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
