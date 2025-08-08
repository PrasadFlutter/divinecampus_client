import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/FamousPoemOfDay.dart';
import '../../api_manager/api_response.dart';

class FamousPoemDayScreen extends StatefulWidget {
  @override
  State<FamousPoemDayScreen> createState() => _FamousPoemDayScreenState();
}

class _FamousPoemDayScreenState extends State<FamousPoemDayScreen> {
  List<FamousPoemDailyModel> dailyfamousPoemScreen = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    dailyfamousPoemScreen = await ApiManager().GetFamousPoemDay();
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
                        '\nFamous Poem for the Day',
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
                        itemCount: dailyfamousPoemScreen.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dailyfamousPoemScreen[i].famousPoemTitle ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),

                                Text(
                                  dailyfamousPoemScreen[i].famousPoemDesc!
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
                                Text(
                                  '\n~${dailyfamousPoemScreen[i].famousPoemWrittenBy}',
                                  style: GoogleFonts.jost(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
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
