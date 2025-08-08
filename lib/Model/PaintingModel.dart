import 'dart:convert';

List<PaintingModel> PaintingModelFromJson(String str) =>
    List<PaintingModel>.from(
        json.decode(str).map((x) => PaintingModel.fromJson(x)));

String PaintingModelToJson(List<PaintingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class PaintingModel {
  PaintingModel({
    required this.PaintingTopic,
    required this.TotalCount,

  });
  String PaintingTopic;
  String TotalCount;

  factory PaintingModel.fromJson(Map<String, dynamic> json) =>
      PaintingModel(
        PaintingTopic: json["PaintingTopic"].toString(),
        TotalCount: json["TotalCount"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "PaintingTopic": PaintingTopic,
    "TotalCount": TotalCount,
  };
}




