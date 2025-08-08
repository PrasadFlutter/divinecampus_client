import 'dart:convert';

List<SymbolModel> SymbolModelFromJson(String str) =>
    List<SymbolModel>.from(
        json.decode(str).map((x) => SymbolModel.fromJson(x)));

String SymbolModelToJson(List<SymbolModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class SymbolModel {
  SymbolModel({
    required this.SymbolCat,
    required this.TotalCount,

  });
  String SymbolCat;
  String TotalCount;

  factory SymbolModel.fromJson(Map<String, dynamic> json) =>
      SymbolModel(
        SymbolCat: json["SymbolCat"].toString(),
        TotalCount: json["TotalCount"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "SymbolCat": SymbolCat,
    "TotalCount": TotalCount,
  };
}




