import 'dart:convert';

List<BookModel> BookModelFromJson(String str) =>
    List<BookModel>.from(
        json.decode(str).map((x) => BookModel.fromJson(x)));

String BookModelToJson(List<BookModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class BookModel {
  BookModel({
    required this.BookID,
    required this.BookName,
    required this.BookFullName,
    required this.BookDesc,
    required this.BookImgUrl,
    required this.BookImgUrlThum,
    required this.BookAmazonUrl,
    required this.BookShortPdfUrl,
    required this.BookPrice,
    required this.usBookPrice,
    required this.BookStatus,
    required this.BookCreatedOn,
    required this.BookImgUrl1,
    required this.BookFullName1,
    required this.BookName1,
    required this.BookCreatedOn106,
    required this.BookStatusText,
    this.BookShortPdfUrl1

  });
  String BookID;
  String BookName;
  String BookFullName;
  String BookDesc;
  String BookImgUrl;
  String BookImgUrlThum;
  String BookAmazonUrl;
  String BookShortPdfUrl;
  String BookPrice;
  String usBookPrice;
  String BookStatus;
  String BookCreatedOn;
  String BookImgUrl1;
  String BookFullName1;
  String BookName1;
  String BookCreatedOn106;
  String BookStatusText;
  String? BookShortPdfUrl1;


  factory BookModel.fromJson(Map<String, dynamic> json) =>
      BookModel(
        BookID: json["BookID"].toString(),
        BookName: json["BookName"].toString(),
        BookFullName: json["BookFullName"].toString(),
        BookDesc: json["BookDesc"].toString(),
        BookImgUrl: json["BookImgUrl"].toString(),
        BookImgUrlThum: json["BookImgUrlThum"].toString(),
        BookAmazonUrl: json["BookAmazonUrl"].toString(),
        BookShortPdfUrl: json["BookShortPdfUrl"].toString(),
        BookShortPdfUrl1: json["BookShortPdfUrl1"].toString(),
        BookPrice: json["BookPrice"].toString(),
        usBookPrice: json["usBookPrice"].toString(),
        BookStatus: json["BookStatus"].toString(),
        BookCreatedOn: json["BookCreatedOn"].toString(),
        BookImgUrl1: json["BookImgUrl1"].toString(),
        BookFullName1: json["BookFullName1"].toString(),
        BookName1: json["BookName1"].toString(),
        BookCreatedOn106: json["BookCreatedOn106"].toString(),
        BookStatusText: json["BookStatusText"].toString(),
      );
  Map<String, dynamic> toJson() => {
    "BookID": BookID,
    "BookName": BookName,
    "BookFullName": BookFullName,
    "BookDesc": BookDesc,
    "BookImgUrl": BookImgUrl,
    "BookImgUrlThum": BookImgUrlThum,
    "BookAmazonUrl": BookAmazonUrl,
    "BookShortPdfUrl": BookShortPdfUrl,
    "BookPrice": BookPrice,
    "usBookPrice": usBookPrice,
    "BookStatus": BookStatus,
    "BookCreatedOn": BookCreatedOn,
    "BookImgUrl1": BookImgUrl1,
    "BookFullName1": BookFullName1,
    "BookName1": BookName1,
    "BookCreatedOn106": BookCreatedOn106,
    "BookShortPdfUrl1": BookShortPdfUrl1,

  };
}




