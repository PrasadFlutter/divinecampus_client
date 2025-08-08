import 'dart:convert';

List<BookTopicModel> BookTopicModelFromJson(String str) =>
    List<BookTopicModel>.from(
        json.decode(str).map((x) => BookTopicModel.fromJson(x)));

String BookTopicModelToJson(List<BookTopicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class BookTopicModel {
  BookTopicModel({
    required this.BookTopicID,
    required this.BookTopicName,
    required this.BookTopicFullName,
    required this.BookTopicImgUrl,
    required this.BookTopicAmazonUrl,
    required this.BookTopicImgUrlThum,
    required this.BookTopicShortPdfUrl,
    required this.BookTopicPrice,
    required this.BookTopicStatus,
    required this.BookTopicCreatedOn,
    required this.BookTopicImgUrl1,
    required this.BookTopicBackprice,
    required this.BookTopicFullName1,
    required this.BookTopicName1,
    required this.BookTopicCreatedOn106,
    required this.BookTopicStatusText

  });
  String BookTopicID;
  String BookTopicName;
  String BookTopicFullName;
  String BookTopicImgUrl;
  String BookTopicImgUrlThum;
  String BookTopicAmazonUrl;
  String BookTopicShortPdfUrl;
  String BookTopicPrice;
  String BookTopicStatus;
  String BookTopicCreatedOn;
  String BookTopicImgUrl1;
  String BookTopicBackprice;
  String BookTopicFullName1;
  String BookTopicName1;
  String BookTopicCreatedOn106;
  String BookTopicStatusText;


  factory BookTopicModel.fromJson(Map<String, dynamic> json) =>
      BookTopicModel(
        BookTopicStatusText: json["BookTopicStatusText"].toString(),
        BookTopicCreatedOn106: json["BookTopicCreatedOn106"].toString(),
        BookTopicName1: json["BookTopicName1"].toString(),
        BookTopicFullName1: json["BookTopicFullName1"].toString(),
        BookTopicBackprice: json["BookTopicBackprice"].toString(),
        BookTopicImgUrl1: json["BookTopicImgUrl1"].toString(),
        BookTopicCreatedOn: json["BookTopicCreatedOn"].toString(),
        BookTopicStatus: json["BookTopicStatus"].toString(),
        BookTopicPrice: json["BookTopicPrice"].toString(),
        BookTopicShortPdfUrl: json["BookTopicShortPdfUrl"].toString(),
        BookTopicAmazonUrl: json["BookTopicAmazonUrl"].toString(),
        BookTopicImgUrlThum: json["BookTopicImgUrlThum"].toString(),
        BookTopicImgUrl: json["BookTopicImgUrl"].toString(),
        BookTopicFullName: json["BookTopicFullName"].toString(),
        BookTopicName: json["BookTopicName"].toString(),
        BookTopicID: json["BookTopicID"].toString(),
      );
  Map<String, dynamic> toJson() => {
    "BookTopicID": BookTopicID,
    "BookTopicName": BookTopicName,
    "BookTopicFullName": BookTopicFullName,
    "BookTopicImgUrl": BookTopicImgUrl,
    "BookTopicImgUrlThum": BookTopicImgUrlThum,
    "BookTopicAmazonUrl": BookTopicAmazonUrl,
    "BookTopicShortPdfUrl": BookTopicShortPdfUrl,
    "BookTopicPrice": BookTopicPrice,
    "BookTopicStatus": BookTopicStatus,
    "BookTopicCreatedOn": BookTopicCreatedOn,
    "BookTopicImgUrl1": BookTopicImgUrl1,
    "BookTopicBackprice": BookTopicBackprice,
    "BookTopicFullName1": BookTopicFullName1,
    "BookTopicName1": BookTopicName1,
    "BookTopicCreatedOn106": BookTopicCreatedOn106,
    "BookTopicStatusText": BookTopicStatusText,

  };
}




