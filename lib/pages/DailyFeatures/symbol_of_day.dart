import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/DailySymbolModel.dart';

import '../../api_manager/api_response.dart';

class SymbolDayScreen extends StatefulWidget {
  @override
  State<SymbolDayScreen> createState() => _SymbolDayScreenState();
}


class _SymbolDayScreenState extends State<SymbolDayScreen> {
  List<SymbolDailyModel> symbolListResponse = [];
  bool loader = true;

  @override
  void initState(){
    super.initState();
    callapi();
  }
  callapi() async {
    symbolListResponse = await ApiManager().GetDailySymbol();
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
                  '\nSACRED SYMBOL OF THE DAY',
                  style: GoogleFonts.jost(color: Color(0xffe00040), fontSize: 20,
                    fontWeight: FontWeight.w700, )


                ),

              ),

              Center(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: symbolListResponse.length,
                    itemBuilder: (context, i) {

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Text(
                              symbolListResponse[i].symbolName??"",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                              symbolListResponse[i].symbolDesc!.replaceAll("</br>", "").replaceAll("<p>", ""),
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
