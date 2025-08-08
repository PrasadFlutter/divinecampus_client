import 'dart:convert';

List<MusicModel> MusicModelFromJson(String str) =>
    List<MusicModel>.from(
        json.decode(str).map((x) => MusicModel.fromJson(x)));

String MusicModelToJson(List<MusicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class MusicModel {
  MusicModel({
    required this.MusicID,
    required this.MusicTopic,
    required this.MusicTitle,
    required this.MusicUrl,
    required this.MusicThumbUrl,
    required this.MusicStatus,
    required this.MusicCreatedOn,
    required this.MusicStatusChangeOn,
    required this.MusicCreatedOn106,
    required this.MusicStatusChangeOn106,
    required this.MusicStatusText,
  });
  String MusicID;
  String MusicTopic;
  String MusicUrl;
  String MusicTitle;
  String MusicThumbUrl;
  String MusicStatus;
  String MusicCreatedOn;
  String MusicStatusChangeOn;
  String MusicCreatedOn106;
  String MusicStatusChangeOn106;
  String MusicStatusText;

  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      MusicModel(
        MusicID: json["MusicID"].toString(),
        MusicTopic: json["MusicTopic"].toString(),
        MusicUrl: json["MusicUrl"].toString(),
        MusicTitle: json["MusicTitle"].toString(),
        MusicThumbUrl: json["MusicThumbUrl"].toString(),
        MusicStatus: json["MusicStatus"].toString(),
        MusicCreatedOn: json["MusicCreatedOn"].toString(),
        MusicStatusChangeOn: json["MusicStatusChangeOn"].toString(),
        MusicCreatedOn106: json["MusicCreatedOn106"].toString(),
        MusicStatusChangeOn106: json["MusicStatusChangeOn106"].toString(),
        MusicStatusText: json["MusicStatusText"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "MusicID": MusicID,
    "MusicTopic": MusicTopic,
    "MusicUrl": MusicUrl,
    "MusicTitle": MusicTitle,
    "MusicThumbUrl": MusicThumbUrl,
    "MusicStatus": MusicStatus,
    "MusicCreatedOn": MusicCreatedOn,
    "MusicStatusText": MusicStatusText,
    "MusicStatusChangeOn106": MusicStatusChangeOn106,
    "MusicCreatedOn106": MusicCreatedOn106,
    "MusicStatusChangeOn": MusicStatusChangeOn,
  };
}




