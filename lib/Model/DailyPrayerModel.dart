
import 'dart:convert';

List<DailyPrayerModel> DailyPrayerModelFromJson(String str) =>
    List<DailyPrayerModel>.from(
        json.decode(str).map((x) => DailyPrayerModel.fromJson(x)));

String DailyPrayerModelToJson(List<DailyPrayerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class DailyPrayerModel {
  int? prayerID;
  String? prayerTitle;
  String? prayerDesc;
  int? prayerStatus;
  String? prayerDisplayDate;
  String? prayerCreatedOn;
  String? prayerUpdatedOn;
  String? prayerStatusChangeOn;
  String? prayerCat;
  String? prayerCreatedOn106;
  String? prayerUpdatedOn106;
  String? prayerStatusChangeOn106;
  String? prayerDisplayDate106;
  String? prayerDisplayDate103;
  String? prayerStatusText;

  DailyPrayerModel(
      {this.prayerID,
        this.prayerTitle,
        this.prayerDesc,
        this.prayerStatus,
        this.prayerDisplayDate,
        this.prayerCreatedOn,
        this.prayerUpdatedOn,
        this.prayerStatusChangeOn,
        this.prayerCat,
        this.prayerCreatedOn106,
        this.prayerUpdatedOn106,
        this.prayerStatusChangeOn106,
        this.prayerDisplayDate106,
        this.prayerDisplayDate103,
        this.prayerStatusText});

  DailyPrayerModel.fromJson(Map<String, dynamic> json) {
    prayerID = json['PrayerID'];
    prayerTitle = json['PrayerTitle'];
    prayerDesc = json['PrayerDesc'];
    prayerStatus = json['PrayerStatus'];
    prayerDisplayDate = json['PrayerDisplayDate'];
    prayerCreatedOn = json['PrayerCreatedOn'];
    prayerUpdatedOn = json['PrayerUpdatedOn'];
    prayerStatusChangeOn = json['PrayerStatusChangeOn'];
    prayerCat = json['PrayerCat'];
    prayerCreatedOn106 = json['PrayerCreatedOn106'];
    prayerUpdatedOn106 = json['PrayerUpdatedOn106'];
    prayerStatusChangeOn106 = json['PrayerStatusChangeOn106'];
    prayerDisplayDate106 = json['PrayerDisplayDate106'];
    prayerDisplayDate103 = json['PrayerDisplayDate103'];
    prayerStatusText = json['PrayerStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PrayerID'] = this.prayerID;
    data['PrayerTitle'] = this.prayerTitle;
    data['PrayerDesc'] = this.prayerDesc;
    data['PrayerStatus'] = this.prayerStatus;
    data['PrayerDisplayDate'] = this.prayerDisplayDate;
    data['PrayerCreatedOn'] = this.prayerCreatedOn;
    data['PrayerUpdatedOn'] = this.prayerUpdatedOn;
    data['PrayerStatusChangeOn'] = this.prayerStatusChangeOn;
    data['PrayerCat'] = this.prayerCat;
    data['PrayerCreatedOn106'] = this.prayerCreatedOn106;
    data['PrayerUpdatedOn106'] = this.prayerUpdatedOn106;
    data['PrayerStatusChangeOn106'] = this.prayerStatusChangeOn106;
    data['PrayerDisplayDate106'] = this.prayerDisplayDate106;
    data['PrayerDisplayDate103'] = this.prayerDisplayDate103;
    data['PrayerStatusText'] = this.prayerStatusText;
    return data;
  }
}