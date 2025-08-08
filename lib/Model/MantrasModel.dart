
import 'dart:convert';

List<MantrasModel> MantrasModelFromJson(String str) =>
    List<MantrasModel>.from(
        json.decode(str).map((x) => MantrasModel.fromJson(x)));

String MantrasModelToJson(List<MantrasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class MantrasModel {
  int? mantrasID;
  String? mantrasTitle;
  String? mantrasDesc;
  String? mantrasMusic;
  int? mantrasStatus;
  String? mantrasDisplayDate;
  String? mantrasCreatedOn;
  Null? mantrasUpdatedOn;
  String? mantrasStatusChangeOn;
  String? mantrasCreatedOn106;
  Null? mantrasUpdatedOn106;
  String? mantrasStatusChangeOn106;
  String? mantrasDisplayDate106;
  String? mantrasDisplayDate103;
  String? mantrasStatusText;

  MantrasModel(
      {this.mantrasID,
        this.mantrasTitle,
        this.mantrasDesc,
        this.mantrasMusic,
        this.mantrasStatus,
        this.mantrasDisplayDate,
        this.mantrasCreatedOn,
        this.mantrasUpdatedOn,
        this.mantrasStatusChangeOn,
        this.mantrasCreatedOn106,
        this.mantrasUpdatedOn106,
        this.mantrasStatusChangeOn106,
        this.mantrasDisplayDate106,
        this.mantrasDisplayDate103,
        this.mantrasStatusText});

  MantrasModel.fromJson(Map<String, dynamic> json) {
    mantrasID = json['MantrasID'];
    mantrasTitle = json['MantrasTitle'];
    mantrasDesc = json['MantrasDesc'];
    mantrasMusic = json['MantrasMusic'];
    mantrasStatus = json['MantrasStatus'];
    mantrasDisplayDate = json['MantrasDisplayDate'];
    mantrasCreatedOn = json['MantrasCreatedOn'];
    mantrasUpdatedOn = json['MantrasUpdatedOn'];
    mantrasStatusChangeOn = json['MantrasStatusChangeOn'];
    mantrasCreatedOn106 = json['MantrasCreatedOn106'];
    mantrasUpdatedOn106 = json['MantrasUpdatedOn106'];
    mantrasStatusChangeOn106 = json['MantrasStatusChangeOn106'];
    mantrasDisplayDate106 = json['MantrasDisplayDate106'];
    mantrasDisplayDate103 = json['MantrasDisplayDate103'];
    mantrasStatusText = json['MantrasStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MantrasID'] = this.mantrasID;
    data['MantrasTitle'] = this.mantrasTitle;
    data['MantrasDesc'] = this.mantrasDesc;
    data['MantrasMusic'] = this.mantrasMusic;
    data['MantrasStatus'] = this.mantrasStatus;
    data['MantrasDisplayDate'] = this.mantrasDisplayDate;
    data['MantrasCreatedOn'] = this.mantrasCreatedOn;
    data['MantrasUpdatedOn'] = this.mantrasUpdatedOn;
    data['MantrasStatusChangeOn'] = this.mantrasStatusChangeOn;
    data['MantrasCreatedOn106'] = this.mantrasCreatedOn106;
    data['MantrasUpdatedOn106'] = this.mantrasUpdatedOn106;
    data['MantrasStatusChangeOn106'] = this.mantrasStatusChangeOn106;
    data['MantrasDisplayDate106'] = this.mantrasDisplayDate106;
    data['MantrasDisplayDate103'] = this.mantrasDisplayDate103;
    data['MantrasStatusText'] = this.mantrasStatusText;
    return data;
  }
}
