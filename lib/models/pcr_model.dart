class PcrData {
  String? date;
  int? count;

  PcrData({this.count, this.date});

  factory PcrData.fromJson(Map<String, dynamic> json) {
    return PcrData(
      count: json['pcr_count'],
      date: json['date'],
    );
  }
}
