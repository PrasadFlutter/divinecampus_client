import 'dart:convert';

List<ReligiousDailyModel> ReligiousDailyModelFromJson(String str) =>
    List<ReligiousDailyModel>.from(
      json.decode(str).map((x) => ReligiousDailyModel.fromJson(x)),
    );

String ReligiousDailyModelToJson(List<ReligiousDailyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReligiousDailyModel {
  int? religiousID;
  String? religiousTitle;
  String? religiousDesc;
  int? religiousStatus;
  String? religiousDisplayDate;
  String? religiousCreatedOn;
  Null religiousUpdatedOn;
  String? religiousStatusChangeOn;
  String? religiousCreatedOn106;
  Null religiousUpdatedOn106;
  String? religiousStatusChangeOn106;
  String? religiousDisplayDate106;
  String? religiousDisplayDate103;
  String? religiousStatusText;

  ReligiousDailyModel({
    this.religiousID,
    this.religiousTitle,
    this.religiousDesc,
    this.religiousStatus,
    this.religiousDisplayDate,
    this.religiousCreatedOn,
    this.religiousUpdatedOn,
    this.religiousStatusChangeOn,
    this.religiousCreatedOn106,
    this.religiousUpdatedOn106,
    this.religiousStatusChangeOn106,
    this.religiousDisplayDate106,
    this.religiousDisplayDate103,
    this.religiousStatusText,
  });

  ReligiousDailyModel.fromJson(Map<String, dynamic> json) {
    religiousID = json['ReligiousID'];
    religiousTitle = json['ReligiousTitle'];
    religiousDesc = json['ReligiousDesc'];
    religiousStatus = json['ReligiousStatus'];
    religiousDisplayDate = json['ReligiousDisplayDate'];
    religiousCreatedOn = json['ReligiousCreatedOn'];
    religiousUpdatedOn = json['ReligiousUpdatedOn'];
    religiousStatusChangeOn = json['ReligiousStatusChangeOn'];
    religiousCreatedOn106 = json['ReligiousCreatedOn106'];
    religiousUpdatedOn106 = json['ReligiousUpdatedOn106'];
    religiousStatusChangeOn106 = json['ReligiousStatusChangeOn106'];
    religiousDisplayDate106 = json['ReligiousDisplayDate106'];
    religiousDisplayDate103 = json['ReligiousDisplayDate103'];
    religiousStatusText = json['ReligiousStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReligiousID'] = this.religiousID;
    data['ReligiousTitle'] = this.religiousTitle;
    data['ReligiousDesc'] = this.religiousDesc;
    data['ReligiousStatus'] = this.religiousStatus;
    data['ReligiousDisplayDate'] = this.religiousDisplayDate;
    data['ReligiousCreatedOn'] = this.religiousCreatedOn;
    data['ReligiousUpdatedOn'] = this.religiousUpdatedOn;
    data['ReligiousStatusChangeOn'] = this.religiousStatusChangeOn;
    data['ReligiousCreatedOn106'] = this.religiousCreatedOn106;
    data['ReligiousUpdatedOn106'] = this.religiousUpdatedOn106;
    data['ReligiousStatusChangeOn106'] = this.religiousStatusChangeOn106;
    data['ReligiousDisplayDate106'] = this.religiousDisplayDate106;
    data['ReligiousDisplayDate103'] = this.religiousDisplayDate103;
    data['ReligiousStatusText'] = this.religiousStatusText;
    return data;
  }
}
