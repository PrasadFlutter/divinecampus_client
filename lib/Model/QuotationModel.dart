import 'dart:convert';

List<QuotationModel> QuotationModelFromJson(String str) =>
    List<QuotationModel>.from(
        json.decode(str).map((x) => QuotationModel.fromJson(x)));

String QuotationModelToJson(List<QuotationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class QuotationModel {
  QuotationModel({
    required this.QuotationTopic,
    required this.TotalCount,

  });
  String QuotationTopic;
  String TotalCount;

  factory QuotationModel.fromJson(Map<String, dynamic> json) =>
      QuotationModel(
        QuotationTopic: json["QuotationTopic"].toString(),
        TotalCount: json["TotalCount"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "QuotationTopic": QuotationTopic,
    "TotalCount": TotalCount,
  };
}




