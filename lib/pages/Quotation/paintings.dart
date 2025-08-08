// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lawexample/Model/PaintingModel.dart';
import 'package:lawexample/api_manager/api_response.dart';
import 'package:lawexample/pages/Quotation/painting_desc.dart';

class PaintingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaintingScreenState();
  }
}

class PaintingScreenState extends State<PaintingScreen> {
  List<PaintingModel> paintinglistresponse = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    paintinglistresponse = await ApiManager().GetPaintingDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //
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
            " Divine Paintings",
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
      ),
      /*   bottomNavigationBar: ConvexAppBar(
          color: Color(0xffe00040),

          // curve: Cu,
          // top: ,
          height: 50,
          style: TabStyle.fixedCircle,
          activeColor: Colors.pink[300],

          backgroundColor: Colors.pink[50],
          items: [
            TabItem(icon: Icons.home, title: "Home"),
            TabItem(icon: Icons.book_outlined, title: 'Books'),
            TabItem(
                icon: Image.asset(
                  "assets/images/splash/splashlogo.png",
                  width: 30,
                  height: 30,
                )),
            TabItem(icon: Icons.call, title: 'Contact'),
            TabItem(icon: Icons.format_align_justify_rounded, title: 'More'),
          ],
          initialActiveIndex: 2,
          //optional, default as 0
          onTap: (int i) {
            if (i == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            }
            if (i == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ebooksPage()));
            }
            if (i == 2) {}
            if (i == 3) {}
          },
        ),*/
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
          child: paintinglistresponse.isNotEmpty
              ? ListView.builder(
                  itemCount: paintinglistresponse.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    double c_width = MediaQuery.of(context).size.width * 0.8;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaintingDescription(
                              PaintingTopic:
                                  paintinglistresponse[i].PaintingTopic,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      paintinglistresponse[i].PaintingTopic,
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 14,
                                        color: Colors.black,
                                        //// fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "(" +
                                        paintinglistresponse[i].TotalCount +
                                        ") ",
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontSize: 13,
                                      color: Colors.blue,
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
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
