import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/MantrasModel.dart';

import '../../api_manager/api_response.dart';

class MantrasScreen extends StatefulWidget {
  @override
  State<MantrasScreen> createState() => _MantrasScreenState();
}


class _MantrasScreenState extends State<MantrasScreen> {
  List<MantrasModel> mantraslistResponse = [];
  bool loader = true;

  @override
  void initState(){
    super.initState();
    callapi();
  }
  callapi() async {
    mantraslistResponse = await ApiManager().GetMantrasDetails();
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
                  '\n DAILY SACRED MANTRAS',
                  style: GoogleFonts.jost(color: Color(0xffe00040), fontSize: 20,
                    fontWeight: FontWeight.w700, )


                ),

              ),

              Center(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: mantraslistResponse.length,
                    itemBuilder: (context, i) {

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${mantraslistResponse[i].mantrasTitle}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red[400],

                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 16),

                           /* Text(
                              mantraslistResponse[i].poemTitle??"",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),*/

                            Text(
                              mantraslistResponse[i].mantrasDesc!.replaceAll("</br>", "").replaceAll("<p>", "")
                              .replaceAll('</span>', "").replaceAll("</em>", "")
                              .replaceAll('</p>', "").replaceAll('<p align="center" style="margin-left:36.0pt;">', '')
                              .replaceAll('<span style="font-size:20px;">', "").replaceAll('<p align="center" style="margin-left:36.0pt;">', '')
                                  .replaceAll('<p align="center">', "").replaceAll('<span style="color:#ff0000;"><span style="font-size: 20px;"><em>', '')
                                  .replaceAll('<p style="text-align: justify;">', ""),
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
