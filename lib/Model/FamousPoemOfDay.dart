
import 'dart:convert';

List<FamousPoemDailyModel> FamousPoemDailyModelFromJson(String str) =>
    List<FamousPoemDailyModel>.from(
        json.decode(str).map((x) => FamousPoemDailyModel.fromJson(x)));

String FamousPoemDailyModelToJson(List<FamousPoemDailyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class FamousPoemDailyModel {
  int? famousPoemID;
  String? famousPoemTitle;
  String? famousPoemDesc;
  int? famousPoemStatus;
  String? famousPoemDisplayDay;
  String? famousPoemCreatedOn;
  Null? famousPoemUpdatedOn;
  String? famousPoemStatusChangeOn;
  String? famousPoemSubmitedBy;
  String? famousPoemWrittenBy;
  String? famousPoemRef;
  String? famousPoemCreatedOn106;
  Null? famousPoemUpdatedOn106;
  String? famousPoemStatusChangeOn106;
  String? famousPoemDisplayDay103;
  String? poemDisplayDateMonthYYYY;
  String? famousPoemStatusText;

  FamousPoemDailyModel(
      {this.famousPoemID,
        this.famousPoemTitle,
        this.famousPoemDesc,
        this.famousPoemStatus,
        this.famousPoemDisplayDay,
        this.famousPoemCreatedOn,
        this.famousPoemUpdatedOn,
        this.famousPoemStatusChangeOn,
        this.famousPoemSubmitedBy,
        this.famousPoemWrittenBy,
        this.famousPoemRef,
        this.famousPoemCreatedOn106,
        this.famousPoemUpdatedOn106,
        this.famousPoemStatusChangeOn106,
        this.famousPoemDisplayDay103,
        this.poemDisplayDateMonthYYYY,
        this.famousPoemStatusText});

  FamousPoemDailyModel.fromJson(Map<String, dynamic> json) {
    famousPoemID = json['FamousPoemID'];
    famousPoemTitle = json['FamousPoemTitle'];
    famousPoemDesc = json['FamousPoemDesc'];
    famousPoemStatus = json['FamousPoemStatus'];
    famousPoemDisplayDay = json['FamousPoemDisplayDay'];
    famousPoemCreatedOn = json['FamousPoemCreatedOn'];
    famousPoemUpdatedOn = json['FamousPoemUpdatedOn'];
    famousPoemStatusChangeOn = json['FamousPoemStatusChangeOn'];
    famousPoemSubmitedBy = json['FamousPoemSubmitedBy'];
    famousPoemWrittenBy = json['FamousPoemWrittenBy'];
    famousPoemRef = json['FamousPoemRef'];
    famousPoemCreatedOn106 = json['FamousPoemCreatedOn106'];
    famousPoemUpdatedOn106 = json['FamousPoemUpdatedOn106'];
    famousPoemStatusChangeOn106 = json['FamousPoemStatusChangeOn106'];
    famousPoemDisplayDay103 = json['FamousPoemDisplayDay103'];
    poemDisplayDateMonthYYYY = json['PoemDisplayDateMonthYYYY'];
    famousPoemStatusText = json['FamousPoemStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FamousPoemID'] = this.famousPoemID;
    data['FamousPoemTitle'] = this.famousPoemTitle;
    data['FamousPoemDesc'] = this.famousPoemDesc;
    data['FamousPoemStatus'] = this.famousPoemStatus;
    data['FamousPoemDisplayDay'] = this.famousPoemDisplayDay;
    data['FamousPoemCreatedOn'] = this.famousPoemCreatedOn;
    data['FamousPoemUpdatedOn'] = this.famousPoemUpdatedOn;
    data['FamousPoemStatusChangeOn'] = this.famousPoemStatusChangeOn;
    data['FamousPoemSubmitedBy'] = this.famousPoemSubmitedBy;
    data['FamousPoemWrittenBy'] = this.famousPoemWrittenBy;
    data['FamousPoemRef'] = this.famousPoemRef;
    data['FamousPoemCreatedOn106'] = this.famousPoemCreatedOn106;
    data['FamousPoemUpdatedOn106'] = this.famousPoemUpdatedOn106;
    data['FamousPoemStatusChangeOn106'] = this.famousPoemStatusChangeOn106;
    data['FamousPoemDisplayDay103'] = this.famousPoemDisplayDay103;
    data['PoemDisplayDateMonthYYYY'] = this.poemDisplayDateMonthYYYY;
    data['FamousPoemStatusText'] = this.famousPoemStatusText;
    return data;
  }
}

