import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/DailyArticleModel.dart';
import '../../api_manager/api_response.dart';

class DailyArticleScreen extends StatefulWidget {
  @override
  State<DailyArticleScreen> createState() => _DailyArticleScreenState();
}

class _DailyArticleScreenState extends State<DailyArticleScreen> {
  List<DailyArticleModel> dailyArticlelist = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    dailyArticlelist = await ApiManager().GetDailyArticle();
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loader
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        '\n DIVINE ARTICLE OF THE DAY',
                        style: GoogleFonts.jost(
                          color: Color(0xffe00040),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Center(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dailyArticlelist.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dailyArticlelist[i].articleTitle ?? "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Author : ${dailyArticlelist[i].articleWrittenBy ?? ""}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  dailyArticlelist[i].articleDesc!
                                      .replaceAll("</br>", "")
                                      .replaceAll("<p>", "")
                                      .replaceAll(
                                        '<p style="text-align: justify;">',
                                        "",
                                      )
                                      .replaceAll("<br />", "")
                                      .replaceAll('&amp;nbsp;', "")
                                      .replaceAll("</p>", "")
                                      .replaceAll("<div>", "")
                                      .replaceAll("&amp;nbsp;</div>", "")
                                      .replaceAll(
                                        '<em><span style="color:#ffffff;"><span style="font-size:20px;">&amp;ldquo;',
                                        "",
                                      )
                                      .replaceAll(
                                        '<div style="text-align: right;">',
                                        "",
                                      )
                                      .replaceAll('</div>', "")
                                      .replaceAll(
                                        '<span style="font-size:20px;">-',
                                        "",
                                      )
                                      .replaceAll('</span>', "")
                                      .replaceAll("</em>", "")
                                      .replaceAll("&amp;", "")
                                      .replaceAll(
                                        '<div style="text-align: justify;">',
                                        "",
                                      )
                                      .replaceAll('<strong>', "")
                                      .replaceAll(
                                        '<strong><span style="color:#a52a2a;">',
                                        "",
                                      )
                                      .replaceAll(
                                        '</span></span></strong></div>',
                                        "",
                                      )
                                      .replaceAll(
                                        '<span style="background-color:#ffff00;">',
                                        "",
                                      )
                                      .replaceAll(
                                        '<span style="color:#a52a2a;">',
                                        "",
                                      )
                                      .replaceAll('</strong>', "")
                                      .replaceAll('</u>', "")
                                      .replaceAll(
                                        '<strong><span style="color:#a52a2a;"><span style="background-color:#ffff00;">',
                                        "",
                                      )
                                      .replaceAll(
                                        '<div style="text-align: center;">',
                                        "",
                                      ),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(fontSize: 15),
                                ),

                                SizedBox(height: 16),
                                Text(
                                  '\n~${dailyArticlelist[i].articleRef}',
                                  style: GoogleFonts.jost(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
