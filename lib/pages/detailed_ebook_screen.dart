// ignore_for_file: unused_field

import 'package:jv_easy_pdf_viewer/jv_easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/api_manager/api_response.dart';

//import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class DetailedebooksPage extends StatefulWidget {
  final String BookName;
  final String BookPrice;
  final String BookAmazonURL;
  final String BookImage;
  final String BookPdfURl;

  const DetailedebooksPage({
    Key? key,
    required this.BookName,
    required this.BookPrice,
    required this.BookPdfURl,
    required this.BookAmazonURL,
    required this.BookImage,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailedebooksPageState();
  }
}

class DetailedebooksPageState extends State<DetailedebooksPage> {
  bool _isLoading = true;
  String? pdfFlePath;
  static const int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  PDFDocument? document;

  @override
  void initState() {
    loadDocument();

    super.initState();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(widget.BookPdfURl);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    '\nDETAILS OF BOOK',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffe00040),
                      //// fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\n${widget.BookName}',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    //// fontWeight: FontWeight.bold,
                  ),
                ),

                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 3.0,
                            ), // Set border width
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ), // Set rounded corner radius
                            // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))] // Make rounded corner of border
                          ),
                          child: Image.network(
                            widget.BookImage,
                            fit: BoxFit.fill,
                          ),
                          width: 140,
                          height: 230,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              //color: Colors.pink[800], // Set border color
                              width: 3.0,
                            ), // Set border width
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),

                            // Set rounded corner radius
                            // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))] // Make rounded corner of border
                          ),
                          child: Column(
                            children: [
                              Text(
                                '~ Shree Ananda Krishna',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 15,
                                  color: Colors.red,
                                  //// fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),

                              Text(
                                'Book Details',

                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 15,
                                  color: Colors.blue,

                                  //// fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              FittedBox(
                                child: Text(
                                  'E-Book Price(India):\n INR ${widget.BookPrice}',
                                  softWrap: false,
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 15,
                                    color: Colors.black,
                                    //// fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  ApiManager().launchUril(widget.BookAmazonURL);
                                },
                                child: FittedBox(
                                  child: Text(
                                    "Buy Online: \n  Click Here",
                                    softWrap: false,
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontSize: 15,
                                      color: Colors.red,
                                      //// fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: 800,
                        child: PDFViewer(
                          document: document!,
                          scrollDirection: Axis.vertical,
                          // zoomSteps: 1,
                          numberPickerConfirmWidget: const Text("Confirm"),
                        ),
                      ),

                /*    Expanded(child:


                      )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
