import 'dart:convert';

List<DailyArticleModel> DailyArticleModelFromJson(String str) =>
    List<DailyArticleModel>.from(
      json.decode(str).map((x) => DailyArticleModel.fromJson(x)),
    );

String DailyArticleModelToJson(List<DailyArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyArticleModel {
  int? articleID;
  String? articleTitle;
  String? articleDesc;
  int? articleStatus;
  String? articleDisplayMonth;
  String? articleCreatedOn;
  Null articleUpdatedOn;
  String? articleStatusChangeOn;
  String? articleSubmitedBy;
  String? articleWrittenBy;
  String? articleRef;
  String? articleCreatedOn106;
  Null articleUpdatedOn106;
  String? articleStatusChangeOn106;
  String? articleDisplayMonth103;
  String? poemDisplayDateMonthYYYY;
  String? articleStatusText;
  String? articleTopic;

  DailyArticleModel({
    this.articleID,
    this.articleTitle,
    this.articleDesc,
    this.articleStatus,
    this.articleDisplayMonth,
    this.articleCreatedOn,
    this.articleUpdatedOn,
    this.articleStatusChangeOn,
    this.articleSubmitedBy,
    this.articleWrittenBy,
    this.articleRef,
    this.articleCreatedOn106,
    this.articleUpdatedOn106,
    this.articleStatusChangeOn106,
    this.articleDisplayMonth103,
    this.poemDisplayDateMonthYYYY,
    this.articleStatusText,
    this.articleTopic,
  });

  DailyArticleModel.fromJson(Map<String, dynamic> json) {
    articleID = json['ArticleID'];
    articleTitle = json['ArticleTitle'];
    articleDesc = json['ArticleDesc'];
    articleStatus = json['ArticleStatus'];
    articleDisplayMonth = json['ArticleDisplayMonth'];
    articleCreatedOn = json['ArticleCreatedOn'];
    articleUpdatedOn = json['ArticleUpdatedOn'];
    articleStatusChangeOn = json['ArticleStatusChangeOn'];
    articleSubmitedBy = json['ArticleSubmitedBy'];
    articleWrittenBy = json['ArticleWrittenBy'];
    articleRef = json['ArticleRef'];
    articleCreatedOn106 = json['ArticleCreatedOn106'];
    articleUpdatedOn106 = json['ArticleUpdatedOn106'];
    articleStatusChangeOn106 = json['ArticleStatusChangeOn106'];
    articleDisplayMonth103 = json['ArticleDisplayMonth103'];
    poemDisplayDateMonthYYYY = json['PoemDisplayDateMonthYYYY'];
    articleStatusText = json['ArticleStatusText'];
    articleTopic = json['ArticleTopic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArticleID'] = this.articleID;
    data['ArticleTitle'] = this.articleTitle;
    data['ArticleDesc'] = this.articleDesc;
    data['ArticleStatus'] = this.articleStatus;
    data['ArticleDisplayMonth'] = this.articleDisplayMonth;
    data['ArticleCreatedOn'] = this.articleCreatedOn;
    data['ArticleUpdatedOn'] = this.articleUpdatedOn;
    data['ArticleStatusChangeOn'] = this.articleStatusChangeOn;
    data['ArticleSubmitedBy'] = this.articleSubmitedBy;
    data['ArticleWrittenBy'] = this.articleWrittenBy;
    data['ArticleRef'] = this.articleRef;
    data['ArticleCreatedOn106'] = this.articleCreatedOn106;
    data['ArticleUpdatedOn106'] = this.articleUpdatedOn106;
    data['ArticleStatusChangeOn106'] = this.articleStatusChangeOn106;
    data['ArticleDisplayMonth103'] = this.articleDisplayMonth103;
    data['PoemDisplayDateMonthYYYY'] = this.poemDisplayDateMonthYYYY;
    data['ArticleStatusText'] = this.articleStatusText;
    data['ArticleTopic'] = this.articleTopic;
    return data;
  }
}
