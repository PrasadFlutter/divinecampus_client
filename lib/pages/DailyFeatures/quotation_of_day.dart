import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/QuotationDayModel.dart';

import '../../api_manager/api_response.dart';

class QuotationDayScreen extends StatefulWidget {
  @override
  State<QuotationDayScreen> createState() => _QuotationDayScreenState();
}

class _QuotationDayScreenState extends State<QuotationDayScreen> {
  List<QuotationDayModel> poemlistResponse = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    poemlistResponse = await ApiManager().GetQuotationDetails();
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
                        '\nQUOTATION OF THE DAY',
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
                        itemCount: poemlistResponse.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  poemlistResponse[i].quotationTopic ?? "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),

                                Text(
                                  poemlistResponse[i].quotationDesc!
                                      .replaceAll("</br>", "")
                                      .replaceAll("<p>", ""),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(fontSize: 15),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '\nQuotation from ${poemlistResponse[i].quotationBy}',
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
