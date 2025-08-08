import 'dart:convert';

List<PaintingDescModel> PaintingDescModelFromJson(String str) =>
    List<PaintingDescModel>.from(
        json.decode(str).map((x) => PaintingDescModel.fromJson(x)));

String PaintingDescModelToJson(List<PaintingDescModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class PaintingDescModel {
  PaintingDescModel({
    this.PaintingID,
    this.PaintingTopic,
    this.PaintingTitle,
    this.PaintingDesc,
    this.PaintingUrl,
    this.PaintingThumbUrl,
    this.SubTopic,
  });
  String? PaintingID;
  String? PaintingTopic;
  String? PaintingTitle;
  String? PaintingDesc;
  String? PaintingUrl;
  String? PaintingThumbUrl;
  String? SubTopic;

  factory PaintingDescModel.fromJson(Map<String, dynamic> json) =>
      PaintingDescModel(
        PaintingID: json["PaintingID"].toString(),
        PaintingTopic: json["PaintingTopic"].toString(),
        PaintingTitle: json["PaintingTitle"].toString(),
        PaintingDesc: json["PaintingDesc"].toString(),
        PaintingUrl: json["PaintingUrl"].toString(),
        PaintingThumbUrl: json["PaintingThumbUrl"].toString(),
        SubTopic: json["SubTopic"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "PaintingID": PaintingTopic,
    "PaintingTopic": PaintingTopic,
    "PaintingTitle": PaintingTitle,
    "PaintingDesc": PaintingDesc,
    "PaintingUrl": PaintingUrl,
    "PaintingThumbUrl": PaintingThumbUrl,
    "SubTopic": SubTopic,
  };
}




