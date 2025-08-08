import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/DailyReligiousModel.dart';

import '../../api_manager/api_response.dart';

class ReligiousDailyScreen extends StatefulWidget {
  @override
  State<ReligiousDailyScreen> createState() => _ReligiousDailyScreenState();
}

class _ReligiousDailyScreenState extends State<ReligiousDailyScreen> {
  List<ReligiousDailyModel> dailyreligiousList = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    dailyreligiousList = await ApiManager().GetReligousDaily();
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
                      child: Text('\n DAILY RELIGIOUS VERSE',
                          style: GoogleFonts.jost(
                            color: Color(0xffe00040),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Center(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dailyreligiousList.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dailyreligiousList[i].religiousTitle ?? "",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                      dailyreligiousList[i]
                                          .religiousDesc!
                                          .replaceAll("</br>", "")
                                          .replaceAll("<p>", "")
                                          .replaceAll(
                                              '<p style="text-align: justify;">', "")
                                          .replaceAll("<br />", "")
                                          .replaceAll('&amp;nbsp;', "")
                                          .replaceAll("</p>", "")
                                          .replaceAll("<div>", "")
                                          .replaceAll("&amp;nbsp;</div>", "")
                                          .replaceAll(
                                              '<em><span style="color:#ffffff;"><span style="font-size:20px;">&amp;ldquo;', "")
                                          .replaceAll(
                                              '<div style="text-align: right;">', "")
                                          .replaceAll('</div>', "")
                                          .replaceAll(
                                              '<span style="font-size:20px;">-', "")
                                          .replaceAll('</span>', "")
                                          .replaceAll("</em>", "")
                                          .replaceAll("&amp;", "")
                                          .replaceAll(
                                              '<div style="text-align: justify;">', "")
                                          .replaceAll('<strong>', "")
                                          .replaceAll(
                                              '<strong><span style="color:#a52a2a;">',
                                              "")
                                          .replaceAll(
                                              '</span></span></strong></div>', "")
                                          .replaceAll(
                                              '<span style="background-color:#ffff00;">',
                                              "")
                                          .replaceAll(
                                              '<span style="color:#a52a2a;">',
                                              "")
                                          .replaceAll('</strong>', "")
                                          .replaceAll('</u>', "")
                                          .replaceAll(
                                              '<strong><span style="color:#a52a2a;"><span style="background-color:#ffff00;">',
                                              "")
                                          .replaceAll(
                                              '<div style="text-align: center;">',
                                              ""),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                      )),
                                  SizedBox(height: 16),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
