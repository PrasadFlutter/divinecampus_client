
import 'dart:convert';

List<SymbolDailyModel> SymbolDailyModelFromJson(String str) =>
    List<SymbolDailyModel>.from(
        json.decode(str).map((x) => SymbolDailyModel.fromJson(x)));

String SymbolDailyModelToJson(List<SymbolDailyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class SymbolDailyModel {
  int? symbolID;
  String? symbolCode;
  String? symbolName;
  String? symbolCat;
  String? symbolDesc;
  String? symbolimgUrl;
  String? symbolUrl;
  String? symbolCreatedOn;
  int? displayFlag;
  String? symbolCreatedOn106;
  String? symbolDisplayDate103;
  String? displayFlagText;

  SymbolDailyModel(
      {this.symbolID,
        this.symbolCode,
        this.symbolName,
        this.symbolCat,
        this.symbolDesc,
        this.symbolimgUrl,
        this.symbolUrl,
        this.symbolCreatedOn,
        this.displayFlag,
        this.symbolCreatedOn106,
        this.symbolDisplayDate103,
        this.displayFlagText});

  SymbolDailyModel.fromJson(Map<String, dynamic> json) {
    symbolID = json['SymbolID'];
    symbolCode = json['SymbolCode'];
    symbolName = json['SymbolName'];
    symbolCat = json['SymbolCat'];
    symbolDesc = json['SymbolDesc'];
    symbolimgUrl = json['SymbolimgUrl'];
    symbolUrl = json['SymbolUrl'];
    symbolCreatedOn = json['SymbolCreatedOn'];
    displayFlag = json['DisplayFlag'];
    symbolCreatedOn106 = json['SymbolCreatedOn106'];
    symbolDisplayDate103 = json['SymbolDisplayDate103'];
    displayFlagText = json['DisplayFlagText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SymbolID'] = this.symbolID;
    data['SymbolCode'] = this.symbolCode;
    data['SymbolName'] = this.symbolName;
    data['SymbolCat'] = this.symbolCat;
    data['SymbolDesc'] = this.symbolDesc;
    data['SymbolimgUrl'] = this.symbolimgUrl;
    data['SymbolUrl'] = this.symbolUrl;
    data['SymbolCreatedOn'] = this.symbolCreatedOn;
    data['DisplayFlag'] = this.displayFlag;
    data['SymbolCreatedOn106'] = this.symbolCreatedOn106;
    data['SymbolDisplayDate103'] = this.symbolDisplayDate103;
    data['DisplayFlagText'] = this.displayFlagText;
    return data;
  }
}