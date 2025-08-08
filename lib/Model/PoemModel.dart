
import 'dart:convert';

List<PoemModel> PoemModelFromJson(String str) =>
    List<PoemModel>.from(
        json.decode(str).map((x) => PoemModel.fromJson(x)));

String PoemModelToJson(List<PoemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class PoemModel {
  int? poemID;
  String? poemTitle;
  String? poemDesc;
  int? poemStatus;
  String? poemTopic;
  int? poemBookID;
  String? bookName;
  String? bookFullName;
  String? poemDisplayDate;
  String? poemCreatedOn;
  Null? poemUpdatedOn;
  String? poemStatusChangeOn;
  String? poemCreatedOn106;
  Null? poemUpdatedOn106;
  String? poemStatusChangeOn106;
  String? poemDisplayDate106;
  String? poemDisplayDate103;
  String? poemStatusText;

  PoemModel(
      {this.poemID,
        this.poemTitle,
        this.poemDesc,
        this.poemStatus,
        this.poemTopic,
        this.poemBookID,
        this.bookName,
        this.bookFullName,
        this.poemDisplayDate,
        this.poemCreatedOn,
        this.poemUpdatedOn,
        this.poemStatusChangeOn,
        this.poemCreatedOn106,
        this.poemUpdatedOn106,
        this.poemStatusChangeOn106,
        this.poemDisplayDate106,
        this.poemDisplayDate103,
        this.poemStatusText});

  PoemModel.fromJson(Map<String, dynamic> json) {
    poemID = json['PoemID'];
    poemTitle = json['PoemTitle'];
    poemDesc = json['PoemDesc'];
    poemStatus = json['PoemStatus'];
    poemTopic = json['PoemTopic'];
    poemBookID = json['PoemBookID'];
    bookName = json['BookName'];
    bookFullName = json['BookFullName'];
    poemDisplayDate = json['PoemDisplayDate'];
    poemCreatedOn = json['PoemCreatedOn'];
    poemUpdatedOn = json['PoemUpdatedOn'];
    poemStatusChangeOn = json['PoemStatusChangeOn'];
    poemCreatedOn106 = json['PoemCreatedOn106'];
    poemUpdatedOn106 = json['PoemUpdatedOn106'];
    poemStatusChangeOn106 = json['PoemStatusChangeOn106'];
    poemDisplayDate106 = json['PoemDisplayDate106'];
    poemDisplayDate103 = json['PoemDisplayDate103'];
    poemStatusText = json['PoemStatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PoemID'] = this.poemID;
    data['PoemTitle'] = this.poemTitle;
    data['PoemDesc'] = this.poemDesc;
    data['PoemStatus'] = this.poemStatus;
    data['PoemTopic'] = this.poemTopic;
    data['PoemBookID'] = this.poemBookID;
    data['BookName'] = this.bookName;
    data['BookFullName'] = this.bookFullName;
    data['PoemDisplayDate'] = this.poemDisplayDate;
    data['PoemCreatedOn'] = this.poemCreatedOn;
    data['PoemUpdatedOn'] = this.poemUpdatedOn;
    data['PoemStatusChangeOn'] = this.poemStatusChangeOn;
    data['PoemCreatedOn106'] = this.poemCreatedOn106;
    data['PoemUpdatedOn106'] = this.poemUpdatedOn106;
    data['PoemStatusChangeOn106'] = this.poemStatusChangeOn106;
    data['PoemDisplayDate106'] = this.poemDisplayDate106;
    data['PoemDisplayDate103'] = this.poemDisplayDate103;
    data['PoemStatusText'] = this.poemStatusText;
    return data;
  }
}
