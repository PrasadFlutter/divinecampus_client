import 'dart:convert';

List<AstroLogicalDataModel> BookModelFromJson(String str) =>
    List<AstroLogicalDataModel>.from(
        json.decode(str).map((x) => AstroLogicalDataModel.fromJson(x)));

String BookModelToJson(List<AstroLogicalDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AstroLogicalDataModel {
  String? astrologicalName;
  String? astrologicalNameMean;
  String? astrologicalGender;
  String? astrologicalReligion;

  AstroLogicalDataModel(
      {this.astrologicalName,
        this.astrologicalNameMean,
        this.astrologicalGender,
        this.astrologicalReligion});

  AstroLogicalDataModel.fromJson(Map<String, dynamic> json) {
    astrologicalName = json['AstrologicalName'];
    astrologicalNameMean = json['AstrologicalNameMean'];
    astrologicalGender = json['AstrologicalGender'];
    astrologicalReligion = json['AstrologicalReligion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AstrologicalName'] = this.astrologicalName;
    data['AstrologicalNameMean'] = this.astrologicalNameMean;
    data['AstrologicalGender'] = this.astrologicalGender;
    data['AstrologicalReligion'] = this.astrologicalReligion;
    return data;
  }
}





