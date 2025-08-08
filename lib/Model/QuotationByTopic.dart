
import 'dart:convert';

List<QuotationByTopic> QuotationByTopicFromJson(String str) =>
    List<QuotationByTopic>.from(
        json.decode(str).map((x) => QuotationByTopic.fromJson(x)));

String QuotationByTopicToJson(List<QuotationByTopic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class QuotationByTopic {

  int? quotationID;
  String? quotationTopic;
  String? quotationDesc;
  int? quotationStatus;
  String? quotationDisplayDate;
  String? quotationCreatedOn;
  String? quotationStatusChangeOn;
  String? quotationBy;
  String? subTopic;
  String? quotationCreatedOn106;
  String? quotationStatusChangeOn106;
  String? quotationDisplayDate106;
  String? quotationDisplayDate103;
  String? quotationStatusText;

  QuotationByTopic(
      {this.quotationID,
        this.quotationTopic,
        this.quotationDesc,
        this.quotationStatus,
        this.quotationDisplayDate,
        this.quotationCreatedOn,
        this.quotationStatusChangeOn,
        this.quotationBy,
        this.subTopic,
        this.quotationCreatedOn106,
        this.quotationStatusChangeOn106,
        this.quotationDisplayDate106,
        this.quotationDisplayDate103,
        this.quotationStatusText});

  QuotationByTopic.fromJson(Map<String, dynamic> json) {
    quotationID = json['QuotationID'];
    quotationTopic = json['QuotationTopic'];
    quotationDesc = json['QuotationDesc'];
    quotationStatus = json['QuotationStatus'];
    quotationDisplayDate = json['QuotationDisplayDate'];
    quotationCreatedOn = json['QuotationCreatedOn'];
    quotationStatusChangeOn = json['QuotationStatusChangeOn'];
    quotationBy = json['QuotationBy'];
    subTopic = json['SubTopic'];
    quotationCreatedOn106 = json['QuotationCreatedOn106'];
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
    data['QuotationStatusChangeOn'] = this.quotationStatusChangeOn;
    data['QuotationBy'] = this.quotationBy;
    data['SubTopic'] = this.subTopic;
    data['QuotationCreatedOn106'] = this.quotationCreatedOn106;
    data['QuotationStatusChangeOn106'] = this.quotationStatusChangeOn106;
    data['QuotationDisplayDate106'] = this.quotationDisplayDate106;
    data['QuotationDisplayDate103'] = this.quotationDisplayDate103;
    data['QuotationStatusText'] = this.quotationStatusText;
    return data;
  }
}