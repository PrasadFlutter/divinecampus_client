
import 'dart:convert';

List<QuotationDayModel> QuotationDayModelFromJson(String str) =>
    List<QuotationDayModel>.from(
        json.decode(str).map((x) => QuotationDayModel.fromJson(x)));

String QuotationDayModelToJson(List<QuotationDayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class QuotationDayModel {
  int? quotationID;
  String? quotationTopic;
  String? quotationDesc;
  int? quotationStatus;
  String? quotationDisplayDate;
  String? quotationCreatedOn;
  Null? quotationUpdatedOn;
  String? quotationStatusChangeOn;
  String? quotationBy;
  String? subTopic;
  String? quotationCreatedOn106;
  Null? quotationUpdatedOn106;
  String? quotationStatusChangeOn106;
  String? quotationDisplayDate106;
  String? quotationDisplayDate103;
  String? quotationStatusText;


  QuotationDayModel(
      {this.quotationID,
        this.quotationTopic,
        this.quotationDesc,
        this.quotationStatus,
        this.quotationDisplayDate,
        this.quotationCreatedOn,
        this.quotationUpdatedOn,
        this.quotationStatusChangeOn,
        this.quotationBy,
        this.subTopic,
        this.quotationCreatedOn106,
        this.quotationUpdatedOn106,
        this.quotationStatusChangeOn106,
        this.quotationDisplayDate106,
        this.quotationDisplayDate103,
        this.quotationStatusText});

  QuotationDayModel.fromJson(Map<String, dynamic> json) {
    quotationID = json['QuotationID'];
    quotationTopic = json['QuotationTopic'];
    quotationDesc = json['QuotationDesc'];
    quotationStatus = json['QuotationStatus'];
    quotationDisplayDate = json['QuotationDisplayDate'];
    quotationCreatedOn = json['QuotationCreatedOn'];
    quotationUpdatedOn = json['QuotationUpdatedOn'];
    quotationStatusChangeOn = json['QuotationStatusChangeOn'];
    quotationBy = json['QuotationBy'];
    subTopic = json['SubTopic'];
    quotationCreatedOn106 = json['QuotationCreatedOn106'];
    quotationUpdatedOn106 = json['QuotationUpdatedOn106'];
    quotationStatusChangeOn106 = json['QuotationStatusChangeOn106'];
    quotationDisplayDate106 = json['QuotationDisplayDate106'];
    quotationDisplayDate103 = json['QuotationDisplayDate103'];
    quotationStatusText = json['QuotationStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuotationID'] = this.quotationID;
    data['QuotationTopic'] = this.quotationTopic;
    data['QuotationDesc'] = this.quotationDesc;
    data['QuotationStatus'] = this.quotationStatus;
    data['QuotationDisplayDate'] = this.quotationDisplayDate;
    data['QuotationCreatedOn'] = this.quotationCreatedOn;
    data['QuotationUpdatedOn'] = this.quotationUpdatedOn;
    data['QuotationStatusChangeOn'] = this.quotationStatusChangeOn;
    data['QuotationBy'] = this.quotationBy;
    data['SubTopic'] = this.subTopic;
    data['QuotationCreatedOn106'] = this.quotationCreatedOn106;
    data['QuotationUpdatedOn106'] = this.quotationUpdatedOn106;
    data['QuotationStatusChangeOn106'] = this.quotationStatusChangeOn106;
    data['QuotationDisplayDate106'] = this.quotationDisplayDate106;
    data['QuotationDisplayDate103'] = this.quotationDisplayDate103;
    data['QuotationStatusText'] = this.quotationStatusText;
    return data;
  }
}
