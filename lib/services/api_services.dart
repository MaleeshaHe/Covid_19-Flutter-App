import 'dart:convert';

import 'package:covid_19/models/covid_data_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPoint = "https://www.hpb.health.gov.lk/api/get-current-statistical";

  Future<CovidDataModel> getData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> data = body['data'];
      CovidDataModel covidData = CovidDataModel.fromJson(data);
      return covidData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
