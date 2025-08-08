
import 'dart:convert';

List<DailyThoughtModel> DailyThoughtModelFromJson(String str) =>
    List<DailyThoughtModel>.from(
        json.decode(str).map((x) => DailyThoughtModel.fromJson(x)));

String DailyThoughtModelToJson(List<DailyThoughtModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class DailyThoughtModel {
  int? thoughtID;
  String? thoughtTitle;
  String? thoughtDesc;
  int? thoughtStatus;
  String? thoughtDisplayDate;
  String? thoughtCreatedOn;
  Null thoughtUpdatedOn;
  String? thoughtStatusChangeOn;
  String? thoughtCreatedOn106;
  Null thoughtUpdatedOn106;
  String? thoughtStatusChangeOn106;
  String? thoughtDisplayDate106;
  String? thoughtDisplayDate103;
  String? thoughtStatusText;

  DailyThoughtModel(
      {this.thoughtID,
        this.thoughtTitle,
        this.thoughtDesc,
        this.thoughtStatus,
        this.thoughtDisplayDate,
        this.thoughtCreatedOn,
        this.thoughtUpdatedOn,
        this.thoughtStatusChangeOn,
        this.thoughtCreatedOn106,
        this.thoughtUpdatedOn106,
        this.thoughtStatusChangeOn106,
        this.thoughtDisplayDate106,
        this.thoughtDisplayDate103,
        this.thoughtStatusText});

  DailyThoughtModel.fromJson(Map<String, dynamic> json) {
    thoughtID = json['ThoughtID'];
    thoughtTitle = json['ThoughtTitle'];
    thoughtDesc = json['ThoughtDesc'];
    thoughtStatus = json['ThoughtStatus'];
    thoughtDisplayDate = json['ThoughtDisplayDate'];
    thoughtCreatedOn = json['ThoughtCreatedOn'];
    thoughtUpdatedOn = json['ThoughtUpdatedOn'];
    thoughtStatusChangeOn = json['ThoughtStatusChangeOn'];
    thoughtCreatedOn106 = json['ThoughtCreatedOn106'];
    thoughtUpdatedOn106 = json['ThoughtUpdatedOn106'];
    thoughtStatusChangeOn106 = json['ThoughtStatusChangeOn106'];
    thoughtDisplayDate106 = json['ThoughtDisplayDate106'];
    thoughtDisplayDate103 = json['ThoughtDisplayDate103'];
    thoughtStatusText = json['ThoughtStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ThoughtID'] = this.thoughtID;
    data['ThoughtTitle'] = this.thoughtTitle;
    data['ThoughtDesc'] = this.thoughtDesc;
    data['ThoughtStatus'] = this.thoughtStatus;
    data['ThoughtDisplayDate'] = this.thoughtDisplayDate;
    data['ThoughtCreatedOn'] = this.thoughtCreatedOn;
    data['ThoughtUpdatedOn'] = this.thoughtUpdatedOn;
    data['ThoughtStatusChangeOn'] = this.thoughtStatusChangeOn;
    data['ThoughtCreatedOn106'] = this.thoughtCreatedOn106;
    data['ThoughtUpdatedOn106'] = this.thoughtUpdatedOn106;
    data['ThoughtStatusChangeOn106'] = this.thoughtStatusChangeOn106;
    data['ThoughtDisplayDate106'] = this.thoughtDisplayDate106;
    data['ThoughtDisplayDate103'] = this.thoughtDisplayDate103;
    data['ThoughtStatusText'] = this.thoughtStatusText;
    return data;
  }
}