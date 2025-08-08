import 'dart:convert';

List<VideoModel> VideoModelFromJson(String str) =>
    List<VideoModel>.from(
        json.decode(str).map((x) => VideoModel.fromJson(x)));

String VideoModelToJson(List<VideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class VideoModel {
  VideoModel({
    required this.VideoID,
    required this.VideoTopic,
    required this.VideoTitle,
    required this.VideoUrl,
    required this.VideoThumbUrl,
    required this.VideoCreatedOn106,
    required this.VideoStatusText,

  });
  String VideoID;
  String VideoTopic;
  String VideoTitle;
  String VideoUrl;
  String VideoThumbUrl;
  String VideoCreatedOn106;
  String VideoStatusText;



  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      VideoModel(
        VideoID: json["VideoID"].toString(),
        VideoTopic: json["VideoTopic"].toString(),
        VideoTitle: json["VideoTitle"].toString(),
        VideoUrl: json["VideoUrl"].toString(),
        VideoThumbUrl: json["VideoThumbUrl"].toString(),
        VideoCreatedOn106: json["VideoCreatedOn106"].toString(),
        VideoStatusText: json["VideoStatusText"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "VideoID": VideoID,
    "VideoTopic": VideoTopic,
    "VideoUrl": VideoUrl,
    "VideoTitle": VideoTitle,
    "VideoThumbUrl": VideoThumbUrl,
    "VideoCreatedOn106": VideoCreatedOn106,
    "VideoStatusText": VideoStatusText,
  };
}




