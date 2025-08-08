import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Model/DailyPrayerModel.dart';
import '../../api_manager/api_response.dart';

class DailyPrayersScreen extends StatefulWidget {
  @override
  State<DailyPrayersScreen> createState() => _DailyPrayersScreenState();
}


class _DailyPrayersScreenState extends State<DailyPrayersScreen> {
  List<DailyPrayerModel> dailyPrayerlistResponse = [];
  bool loader = true;

  @override
  void initState(){
    super.initState();
    callapi();
  }
  callapi() async {
    dailyPrayerlistResponse = await ApiManager().GetDailyPrayers();
    setState(() {
      loader = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loader?Center(child: CircularProgressIndicator())

       : SingleChildScrollView(
          child:Column(
            children: [
              Center(
                child:  Text(
                  '\nDAILY PRAYER',
                  style: GoogleFonts.jost(color: Color(0xffe00040), fontSize: 20,
                    fontWeight: FontWeight.w700, )


                ),

              ),

              Center(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dailyPrayerlistResponse.length,
                    itemBuilder: (context, i) {

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Text(
                              dailyPrayerlistResponse[i].prayerTitle??"",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                              Bidi.stripHtmlIfNeeded(dailyPrayerlistResponse[i].prayerDesc!.replaceAll("nbsp;", "")),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(fontSize: 15,)
                            ),
                            SizedBox(height: 16),

                          ],
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
