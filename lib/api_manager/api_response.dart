// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:lawexample/Model/BookModel.dart';
import 'package:lawexample/Model/BookTopicModel.dart';
import 'package:lawexample/Model/DailyArticleModel.dart';
import 'package:lawexample/Model/DailyPrayerModel.dart';
import 'package:lawexample/Model/DailyThoughtModel.dart';
import 'package:lawexample/Model/FamousPoemOfDay.dart';
import 'package:lawexample/Model/MantrasModel.dart';
import 'package:lawexample/Model/MusicModel.dart';
import 'package:lawexample/Model/PaintingDescModel.dart';
import 'package:lawexample/Model/PaintingModel.dart';
import 'package:lawexample/Model/QuotationByTopic.dart';
import 'package:lawexample/Model/QuotationDayModel.dart';
import 'package:lawexample/Model/QuotationModel.dart';
import 'package:lawexample/Model/SymbolModel.dart';
import 'package:lawexample/Model/VideoModel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/AstrologicalModel.dart';
import '../Model/DailyReligiousModel.dart';
import '../Model/DailySymbolModel.dart';
import '../Model/LoginModel.dart';
import '../Model/PoemModel.dart';
import '../Model/SymbolTopicModel.dart';

class ApiManager {
  ////Live Env
  static const domainUrl = 'http://divinecampus.com/Divinecampus.asmx/';
  static const domain = 'divinecampus.com';

  //APIs
  static const BOOK_DISPLAY = "BookDisplay";
  static const BOOK_TOPIC_DISPLAY = "BookTopicDisplay";
  static const EBOOK_DETAIL = "eBookDetail";
  static const EBOOK_MUSIC_DISPLAY = "eBookMusicDisplay";
  static const EBOOK_MUSIC_DISPLAY_BYTOPIC = "eBookMusic_DisplayByTopic";
  static const EBOOK_PAINTING = "eBookPaintingDisplay";
  static const EBOOK_PAINTING_TOPICWISE = "eBookPaintingTopicWiseDisplay";
  static const EBOOK_QUOTATION_DISPLAY = "eBookQuotationDisplay";
  static const EBOOK_QUOTATION_TOPIC_DISPLAY = "eBookQuotationTopicWiseDisplay";
  static const EBOOK_SYMBOL = "eBookSymbolDisplay";
  static const EBOOK_SYMBOL_TOPIC = "eBookSymbolTopicWiseDisplay";
  static const EBOOK_VIDEO = "eBookVideoDisplay";
  static const SHORT_VIDEO = "shortVideoDisplay";
  static const INSERT_REG = "insert_registration";
  static const LOGIN = "login";
  static const QuotationByTopicName = "Quotation_DisplayByTopic";
  static const SymbolByTopicName = "eBookSymbolTopicWiseDisplay";
  static const PoemofDay = "bPoem_Display";
  static const quotationOfDay = "Quotation_DisplayQuotationofTheDay_ID";
  static const prayersOfDay = "Daily_Prayer_DisplayPrayerofTheDays";
  static const thoughtOfDay = "Thought_DisplayThoughtofTheDays";
  static const symbolOfDay = "Symbol_DisplaySymbolofTheDays";
  static const MantrasofDay = "Mantras_DisplayMantrasofTheDays";
  static const ReligiousofDay = "Religious_DisplayReligiousofTheDays";
  static const famousPoemofDay = "FamousPoem_DisplayFamousPoemOfTheDays";
  static const hindiBook = "hindibookdisplay";
  static const articleDay = "bArticle_Display";
  static const getAstroName = "GetAstroName";

  Future<List<BookModel>> GetBookDetails() async {
    final List<BookModel> booklistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.BOOK_DISPLAY;
    http.Response req = await http.get(Uri.parse(url));

    var data = xml.XmlDocument.parse(req.body);

    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);

    try {
      for (var data in jsondata) {
        booklistresponse.add(
          BookModel(
            BookID: data["BookID"].toString(),
            BookName: data["BookName"].toString(),
            BookFullName: data["BookFullName"].toString(),
            BookDesc: data["BookDesc"].toString(),
            BookImgUrl: data["BookImgUrl"].toString(),
            BookImgUrlThum: data["BookImgUrlThum"].toString(),
            BookAmazonUrl: data["BookAmazonUrl"].toString(),
            BookShortPdfUrl: data["BookShortPdfUrl"].toString(),
            BookPrice: data["BookPrice"].toString(),
            BookCreatedOn: data["BookCreatedOn"].toString(),
            usBookPrice: data["usBookPrice"].toString(),
            BookStatus: data["BookStatus"].toString(),
            BookImgUrl1: data["BookImgUrl1"].toString(),
            BookName1: data["BookName1"].toString(),
            BookFullName1: data["BookFullName1"].toString(),
            BookCreatedOn106: data["BookCreatedOn106"].toString(),
            BookStatusText: data["BookStatusText"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return booklistresponse;
  }

  Future<List<BookModel>> GetHindiBookDetails() async {
    final List<BookModel> booklistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.hindiBook;
    http.Response req = await http.get(Uri.parse(url));

    var data = xml.XmlDocument.parse(req.body);

    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);

    try {
      for (var data in jsondata) {
        booklistresponse.add(
          BookModel(
            BookID: data["BookID"].toString(),
            BookName: data["BookName"].toString(),
            BookFullName: data["BookFullName"].toString(),
            BookDesc: data["BookDesc"].toString(),
            BookImgUrl: data["BookImgUrl"].toString(),
            BookImgUrlThum: data["BookImgUrlThum"].toString(),
            BookAmazonUrl: data["BookAmazonUrl"].toString(),
            BookShortPdfUrl: data["BookShortPdfUrl"].toString(),
            BookShortPdfUrl1: data["BookShortPdfUrl1"].toString(),
            BookPrice: data["BookPrice"].toString(),
            BookCreatedOn: data["BookCreatedOn"].toString(),
            usBookPrice: data["usBookPrice"].toString(),
            BookStatus: data["BookStatus"].toString(),
            BookImgUrl1: data["BookImgUrl1"].toString(),
            BookName1: data["BookName1"].toString(),
            BookFullName1: data["BookFullName1"].toString(),
            BookCreatedOn106: data["BookCreatedOn106"].toString(),
            BookStatusText: data["BookStatusText"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return booklistresponse;
  }

  Future<List<BookTopicModel>> GetTopicDetails() async {
    final List<BookTopicModel> bookTopiclistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.BOOK_TOPIC_DISPLAY;
    http.Response req = await http.get(Uri.parse(url));

    var data = xml.XmlDocument.parse(req.body);

    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);

    try {
      for (var data in jsondata) {
        bookTopiclistresponse.add(
          BookTopicModel(
            BookTopicID: data["BookTopicID"].toString(),
            BookTopicName: data["BookTopicName"].toString(),
            BookTopicFullName: data["BookTopicFullName"].toString(),
            BookTopicImgUrl: data["BookTopicImgUrl"].toString(),
            BookTopicImgUrlThum: data["BookTopicImgUrlThum"].toString(),
            BookTopicAmazonUrl: data["BookTopicAmazonUrl"].toString(),
            BookTopicShortPdfUrl: data["BookTopicShortPdfUrl"].toString(),
            BookTopicPrice: data["BookTopicPrice"].toString(),
            BookTopicStatus: data["BookTopicStatus"].toString(),
            BookTopicCreatedOn: data["BookTopicCreatedOn"].toString(),
            BookTopicImgUrl1: data["BookTopicImgUrl1"].toString(),
            BookTopicBackprice: data["BookTopicBackprice"].toString(),
            BookTopicFullName1: data["BookTopicFullName1"].toString(),
            BookTopicName1: data["BookTopicName1"].toString(),
            BookTopicCreatedOn106: data["BookTopicCreatedOn106"].toString(),
            BookTopicStatusText: data["BookTopicStatusText"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return bookTopiclistresponse;
  }

  Future<List<MusicModel>> GetMusicDetails() async {
    final List<MusicModel> musiclistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.EBOOK_MUSIC_DISPLAY;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        musiclistresponse.add(
          MusicModel(
            MusicID: data["MusicID"].toString(),
            MusicTopic: data["MusicTopic"].toString(),
            MusicTitle: data["MusicTitle"].toString(),
            MusicUrl: data["MusicUrl"].toString(),
            MusicThumbUrl: data["MusicThumbUrl"].toString(),
            MusicStatus: data["MusicStatus"].toString(),
            MusicCreatedOn: data["MusicCreatedOn"].toString(),
            MusicStatusChangeOn: data["MusicStatusChangeOn"].toString(),
            MusicCreatedOn106: data["MusicCreatedOn106"].toString(),
            MusicStatusChangeOn106: data["MusicStatusChangeOn106"].toString(),
            MusicStatusText: data["MusicStatusText"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return musiclistresponse;
  }

  Future<List<PaintingModel>> GetPaintingDetails() async {
    final List<PaintingModel> paintinglistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.EBOOK_PAINTING;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        paintinglistresponse.add(
          PaintingModel(
            PaintingTopic: data["PaintingTopic"].toString(),
            TotalCount: data["TotalCount"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return paintinglistresponse;
  }

  Future<List<QuotationModel>> GetQuotationModel() async {
    final List<QuotationModel> quotationlistresponse = [];
    var url = ApiManager.domainUrl + ApiManager.EBOOK_QUOTATION_DISPLAY;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        quotationlistresponse.add(
          QuotationModel(
            QuotationTopic: data["QuotationTopic"].toString(),
            TotalCount: data["TotalCount"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return quotationlistresponse;
  }

  Future<List<SymbolModel>> GetSymbolDetails() async {
    final List<SymbolModel> symbolListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.EBOOK_SYMBOL;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        symbolListResponse.add(
          SymbolModel(
            SymbolCat: data["SymbolCat"].toString(),
            TotalCount: data["TotalCount"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return symbolListResponse;
  }

  Future<List<VideoModel>> GetVideoDetails(String selectedType) async {
    final List<VideoModel> videoListResponse = [];
    print(selectedType);
    var url = selectedType == "SHORT"
        ? ApiManager.domainUrl + ApiManager.SHORT_VIDEO
        : ApiManager.domainUrl + ApiManager.EBOOK_VIDEO;
    print("URL");
    print("URL $url");

    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        videoListResponse.add(
          VideoModel(
            VideoID: data["VideoID"].toString(),
            VideoTopic: data["VideoTopic"].toString(),
            VideoUrl: data["VideoUrl"].toString(),
            VideoThumbUrl: data["VideoThumbUrl"].toString(),
            VideoCreatedOn106: data["VideoCreatedOn106"].toString(),
            VideoStatusText: data["VideoStatusText"].toString(),
            VideoTitle: data["VideoTitle"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return videoListResponse;
  }

  Future<List<PoemModel>> GetPoemDetails() async {
    final List<PoemModel> poemListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.PoemofDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        poemListResponse.add(
          PoemModel(
            poemID: data["PoemID"],
            poemTitle: data["PoemTitle"].toString(),
            poemTopic: data["PoemTopic"].toString(),
            poemDesc: data["PoemDesc"].toString(),
            bookFullName: data["BookFullName"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return poemListResponse;
  }

  Future<List<MantrasModel>> GetMantrasDetails() async {
    final List<MantrasModel> mantrasListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.MantrasofDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        mantrasListResponse.add(
          MantrasModel(
            mantrasID: data["MantrasID"],
            mantrasTitle: data["MantrasTitle"].toString(),
            mantrasDesc: data["MantrasDesc"].toString(),
            // poemDesc: data["PoemDesc"].toString(),
            mantrasMusic: data["MantrasMusic"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return mantrasListResponse;
  }

  Future<List<QuotationDayModel>> GetQuotationDetails() async {
    final List<QuotationDayModel> poemListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.quotationOfDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        poemListResponse.add(
          QuotationDayModel(
            quotationID: data["QuotationID"],
            quotationTopic: data["QuotationTopic"].toString(),
            quotationDesc: data["QuotationDesc"].toString(),
            quotationBy: data["QuotationBy"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return poemListResponse;
  }

  Future<List<DailyPrayerModel>> GetDailyPrayers() async {
    final List<DailyPrayerModel> dailyListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.prayersOfDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        dailyListResponse.add(
          DailyPrayerModel(
            prayerID: data["PrayerID"],
            prayerTitle: data["PrayerTitle"].toString(),
            prayerDesc: data["PrayerDesc"].toString(),
            prayerCat: data["PrayerCat"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return dailyListResponse;
  }

  Future<List<DailyThoughtModel>> GetDailyThought() async {
    final List<DailyThoughtModel> dailyListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.thoughtOfDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        dailyListResponse.add(
          DailyThoughtModel(
            thoughtID: data["ThoughtID"],
            thoughtTitle: data["ThoughtTitle"].toString(),
            thoughtDesc: data["ThoughtDesc"].toString(),
            thoughtStatusText: data["ThoughtStatusText"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return dailyListResponse;
  }

  Future<List<SymbolDailyModel>> GetDailySymbol() async {
    final List<SymbolDailyModel> symbolListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.symbolOfDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        symbolListResponse.add(
          SymbolDailyModel(
            symbolID: data["SymbolID"],
            symbolName: data["SymbolName"].toString(),
            symbolDesc: data["SymbolDesc"].toString(),
            symbolimgUrl: data["SymbolimgUrl"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return symbolListResponse;
  }

  Future<List<ReligiousDailyModel>> GetReligousDaily() async {
    final List<ReligiousDailyModel> religousList = [];
    var url = ApiManager.domainUrl + ApiManager.ReligiousofDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        religousList.add(
          ReligiousDailyModel(
            religiousID: data["ReligiousID"],
            religiousTitle: data["ReligiousTitle"].toString(),
            religiousDesc: data["ReligiousDesc"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return religousList;
  }

  Future<List<FamousPoemDailyModel>> GetFamousPoemDay() async {
    final List<FamousPoemDailyModel> famousPoemList = [];
    var url = ApiManager.domainUrl + ApiManager.famousPoemofDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        famousPoemList.add(
          FamousPoemDailyModel(
            famousPoemID: data["FamousPoemID"],
            famousPoemTitle: data["FamousPoemTitle"].toString(),
            famousPoemDesc: data["FamousPoemDesc"].toString(),
            famousPoemWrittenBy: data["FamousPoemWrittenBy"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return famousPoemList;
  }

  Future<List<DailyArticleModel>> GetDailyArticle() async {
    final List<DailyArticleModel> dailyArticleList = [];
    var url = ApiManager.domainUrl + ApiManager.articleDay;
    http.Response req = await http.get(Uri.parse(url));
    var data = xml.XmlDocument.parse(req.body);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        dailyArticleList.add(
          DailyArticleModel(
            articleID: data["ArticleID"],
            articleTitle: data["ArticleTitle"].toString(),
            articleDesc: data["ArticleDesc"].toString(),
            articleWrittenBy: data["ArticleWrittenBy"].toString(),
            articleRef: data["ArticleRef"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    return dailyArticleList;
  }

  Future<String> InsertRegistration(
    String FirstName,
    String LastName,
    String EmailAddress,
    String MobileNumber,
    String Password,
  ) async {
    var url = ApiManager.domainUrl + ApiManager.INSERT_REG;
    Map<String, dynamic> data = {
      'firstname': FirstName,
      'lastname': LastName,
      'emailid': EmailAddress,
      'mobileno': MobileNumber,
      'password': Password,
    };
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: data,
      encoding: Encoding.getByName("utf-8"),
    );

    try {
      var data = xml.XmlDocument.parse(resp.body);
      print(data);
      var jsondata = jsonDecode(data.children[2].children[0].toString());
      print(jsondata);
      return jsondata;
    } catch (e) {
      print("Returning -1");
      return "-1";
    }
  }

  Future<List<LoginModel>> Login(String MobNo, String Password) async {
    final List<LoginModel> loginlistResponse = [];
    var url = ApiManager.domainUrl + ApiManager.LOGIN;
    Map<String, dynamic> body = {'mobileno': MobNo, 'password': Password};
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );
    var data = xml.XmlDocument.parse(resp.body);
    print(data);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        loginlistResponse.add(
          LoginModel(
            firstname: data["firstname"].toString(),
            lastname: data["lastname"].toString(),
            user_reg_id: data["user_reg_id"].toString(),
            emailid: data["emailid"].toString(),
            mobileno: data["mobileno"].toString(),
            password: data["password"].toString(),
            Status: data["Status"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }
    print(loginlistResponse);
    return loginlistResponse;
  }

  Future<List<PaintingDescModel>> ListPaintingDesc(String paintingName) async {
    final List<PaintingDescModel> paintingDesclistResponse = [];
    var url = ApiManager.domainUrl + ApiManager.EBOOK_PAINTING_TOPICWISE;
    Map<String, dynamic> body = {'strTopic': paintingName};
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );
    var data = xml.XmlDocument.parse(resp.body);
    print(data);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        paintingDesclistResponse.add(
          PaintingDescModel(
            PaintingID: data["PaintingID"].toString(),
            PaintingTopic: data["PaintingTopic"].toString(),
            PaintingDesc: data["PaintingDesc"].toString(),
            PaintingThumbUrl: data["PaintingThumbUrl"].toString(),
            PaintingUrl: data["PaintingUrl"].toString(),
            PaintingTitle: data["PaintingTitle"].toString(),
            SubTopic: data["SubTopic"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }

    return paintingDesclistResponse;
  }

  Future<List<AstroLogicalDataModel>> ListAstroData(
    String day,
    String month,
    String religion,
    String sign,
    String gender,
  ) async {
    final List<AstroLogicalDataModel> astroList = [];
    var url = ApiManager.domainUrl + ApiManager.getAstroName;
    Map<String, dynamic> body = {
      'strDay1': day,
      'strMonth1': month,
      'strReligion1': religion,
      'strSign1': sign,
      'strGender1': gender,
    };
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );
    var data = xml.XmlDocument.parse(resp.body);
    print(data);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        astroList.add(
          AstroLogicalDataModel(
            astrologicalName: data["AstrologicalName"].toString(),
            astrologicalNameMean: data["AstrologicalNameMean"].toString(),
            astrologicalGender: data["AstrologicalGender"].toString(),
            astrologicalReligion: data["AstrologicalReligion"].toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }

    return astroList;
  }

  Future<List<QuotationByTopic>> ListQuotationByTopic(
    String quotationName,
  ) async {
    final List<QuotationByTopic> quotationListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.QuotationByTopicName;
    Map<String, dynamic> body = {'strQuotationTopic': quotationName};
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );
    var data = xml.XmlDocument.parse(resp.body);
    print(data);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        quotationListResponse.add(
          QuotationByTopic(
            quotationTopic: data["QuotationTopic"].toString(),
            quotationBy: data["QuotationBy"].toString(),
            quotationDesc: data["QuotationDesc"].toString(),
            quotationID: data["QuotationID"],
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }

    return quotationListResponse;
  }

  Future<List<SymbolDescriptionBytopic>> ListSymbolByTopic(
    String symbolName,
  ) async {
    final List<SymbolDescriptionBytopic> symbolListResponse = [];
    var url = ApiManager.domainUrl + ApiManager.SymbolByTopicName;
    Map<String, dynamic> body = {'strSymbolCat': symbolName};
    var resp = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );
    var data = xml.XmlDocument.parse(resp.body);
    print(data);
    var jsondata = jsonDecode(data.children[2].children[0].toString());
    print(jsondata);
    try {
      for (var data in jsondata) {
        symbolListResponse.add(
          SymbolDescriptionBytopic(
            symbolCode: data["SymbolCode"].toString(),
            symbolName: data["SymbolName"].toString(),
            symbolDesc: data["SymbolDesc"].toString(),
            symbolimgUrl: data["SymbolimgUrl"],
            symbolUrl: data["SymbolUrl"],
          ),
        );
      }
    } catch (e) {
      print(e);
      print("Returning -1");
    }

    return symbolListResponse;
  }

  Future<void> launchUril(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
