import 'package:covid_19/models/pcr_model.dart';

class CovidDataModel {
  int? totalDeaths;
  int? totalRecoverd;
  int? totalCases;
  int? activeCases;
  List<PcrData>? pcrData;

  CovidDataModel(
      {this.activeCases,
      this.totalCases,
      this.totalDeaths,
      this.totalRecoverd,
      this.pcrData});

  factory CovidDataModel.fromJson(Map<String, dynamic> json) {
    List<PcrData> pcrDataList = (json['daliy_per_testing_data'] as List)
        .map((day) => PcrData.fromJson(day))
        .toList();

    return CovidDataModel(
      activeCases: json['local_active_cases'],
      totalCases: json['local_total_cases'],
      totalDeaths: json['local_deaths'],
      totalRecoverd: json['local_recovered'],
      pcrData: pcrDataList,
    );
  }
}
