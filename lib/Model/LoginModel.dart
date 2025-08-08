import 'dart:convert';

List<LoginModel> LoginModelFromJson(String str) =>
    List<LoginModel>.from(
        json.decode(str).map((x) => LoginModel.fromJson(x)));

String LoginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class LoginModel {
  LoginModel({
    required this.firstname,
    required this.lastname,
    required this.emailid,
    required this.mobileno,
    required this.password,
    required this.Status,
    required this.user_reg_id,

  });
  String firstname;
  String lastname;
  String user_reg_id;
  String Status;
  String password;
  String mobileno;
  String emailid;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        firstname: json["firstname"].toString(),
        lastname: json["lastname"].toString(),
        user_reg_id: json["user_reg_id"].toString(),
        Status: json["Status"].toString(),
        password: json["password"].toString(),
        mobileno: json["mobileno"].toString(),
        emailid: json["emailid"].toString(),

      );
  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "user_reg_id": user_reg_id,
    "Status": Status,
    "password": password,
    "mobileno": mobileno,
    "emailid": emailid,
  };
}




