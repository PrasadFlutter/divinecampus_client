import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lawexample/Model/PoemModel.dart';

import '../../api_manager/api_response.dart';

class PoemScreen extends StatefulWidget {
  @override
  State<PoemScreen> createState() => _PoemScreenState();
}


class _PoemScreenState extends State<PoemScreen> {
  List<PoemModel> poemlistResponse = [];
  bool loader = true;

  @override
  void initState(){
    super.initState();
    callapi();
  }
  callapi() async {
    poemlistResponse = await ApiManager().GetPoemDetails();
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
                  '\nPOEM OF THE DAY',
                  style: GoogleFonts.jost(color: Color(0xffe00040), fontSize: 20,
                    fontWeight: FontWeight.w700, )


                ),

              ),

              Center(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: poemlistResponse.length,
                    itemBuilder: (context, i) {

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Poem on ${poemlistResponse[i].poemTopic}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.red[400],

                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                              poemlistResponse[i].poemTitle??"",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                                Bidi.stripHtmlIfNeeded( poemlistResponse[i].poemDesc!.replaceAll("</br>", "").replaceAll("<p>", "")),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(fontSize: 15,)
                            ),
                            SizedBox(height: 16),
                            Text(
                                '\nPoem from ${poemlistResponse[i].bookFullName}',
                                style: GoogleFonts.jost(color: Colors.blue, fontSize: 20,
                                  fontWeight: FontWeight.w700, )


                            ),
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
