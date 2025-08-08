import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/DailyThoughtModel.dart';
import '../../api_manager/api_response.dart';

class DailyThoughtScreen extends StatefulWidget {
  @override
  State<DailyThoughtScreen> createState() => _DailyThoughtScreenState();
}

class _DailyThoughtScreenState extends State<DailyThoughtScreen> {
  List<DailyThoughtModel> dailythoughtScreen = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    dailythoughtScreen = await ApiManager().GetDailyThought();
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
                        '\nINSPIRING THOUGHT OF THE DAY',
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
                        itemCount: dailythoughtScreen.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dailythoughtScreen[i].thoughtTitle ?? "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),

                                Text(
                                  dailythoughtScreen[i].thoughtDesc!
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
                                      .replaceAll("&amp;", ""),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(fontSize: 15),
                                ),
                                SizedBox(height: 16),
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
