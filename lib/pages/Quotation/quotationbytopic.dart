//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lawexample/Model/QuotationByTopic.dart';
import 'package:lawexample/api_manager/api_response.dart';

class QuotationDescription extends StatefulWidget {
  final String QuotationTopic;

  const QuotationDescription({Key? key, required this.QuotationTopic})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuotationDescriptionState();
  }
}

class QuotationDescriptionState extends State<QuotationDescription> {
  List<QuotationByTopic> quotationDescription = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    quotationDescription = await ApiManager().ListQuotationByTopic(
      widget.QuotationTopic,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded, color: Color(0xffe00040)),
        ),
        title: Center(
          child: Text(
            " Divine Quotation",
            //  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            style: TextStyle(
              fontFamily: 'Jost',
              color: Color(0xffe00040),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(decoration: BoxDecoration()),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
          child: quotationDescription.isNotEmpty
              ? ListView.builder(
                  itemCount: quotationDescription.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    double c_width = MediaQuery.of(context).size.width * 0.8;

                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Quotation ${i + 1} :',

                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontSize: 15,
                                      //// fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  Text(
                                    quotationDescription[i].quotationTopic!,
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontSize: 13,
                                      color: Colors.black,
                                      //// fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                quotationDescription[i].quotationDesc!,
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 13,
                                  color: Colors.black,
                                  //// fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  quotationDescription[i].quotationBy!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,

                                    //// fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              /*GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 1.8,
                        crossAxisCount: 2,
                        mainAxisExtent: 290,
                        // here set custom Height You Want

                        childAspectRatio: 1.0),
                    itemCount: quotationDescription.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Container(
                            // height: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\n Quotation ${quotationDescription[i].quotationID}',
                                      maxLines: 4,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style:TextStyle(
                                          fontFamily: 'Jost',    
                                        fontSize: 14,
                                        //// fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                      '\n${quotationDescription[i].quotationTopic}',
                                      maxLines: 4,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style:TextStyle(
                                          fontFamily: 'Jost',    
                                        fontSize: 14,
                                        //// fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })*/
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
