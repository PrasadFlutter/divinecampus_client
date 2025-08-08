import 'package:carousel_slider/carousel_slider.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/NotificationService/getFcm.dart';
import 'package:lawexample/pages/DailyFeatures/dailyAstro.dart';
import 'package:lawexample/pages/DailyFeatures/daily_article.dart';
import 'package:lawexample/pages/DailyFeatures/famous_poem_of_day.dart';
import 'package:lawexample/pages/DailyFeatures/mantras_of_day.dart';
import 'package:lawexample/pages/DailyFeatures/poem_of_day.dart';
import 'package:lawexample/pages/DailyFeatures/quotation_of_day.dart';
import 'package:lawexample/pages/DailyFeatures/religious_daily.dart';
import 'package:lawexample/pages/Music/music.dart';
import 'package:lawexample/pages/Quotation/paintings.dart';
import 'package:lawexample/pages/Quotation/quotation.dart';
import 'package:lawexample/pages/Video/video.dart';
import 'package:lawexample/pages/contact_page.dart';
import 'package:lawexample/pages/ebooks_page.dart';

import '../Model/VideoModel.dart';
import '../api_manager/api_response.dart';
import 'DailyFeatures/dailyprayers.dart';
import 'DailyFeatures/dailythoughts.dart';
import 'DailyFeatures/symbol_of_day.dart';
import 'Quotation/Symbols.dart';
import 'Topic/eTopic.dart';
import 'Video/detailed_video.dart';
import 'hindibooks/ehindibooks.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  List<VideoModel> videolistResponse = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    videolistResponse = await ApiManager().GetVideoDetails("FULL");
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getFcmToken();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Divine Campus",
            //  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            style: TextStyle(
              fontFamily: 'Jost',
              color: Color(0xffe00040),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            /*         gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )*/
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.account_circle, color: Color(0xffe00040)),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
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
            ),
          ),
          TabItem(icon: Icons.call, title: 'Contact'),
          TabItem(icon: Icons.format_align_justify_rounded, title: 'More'),
        ],
        initialActiveIndex: 2,
        //optional, default as 0
        onTap: (int i) {
          if (i == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ebooksPage()),
            );
          }
          if (i == 2) {}
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
          }
        },
      ),
      body: loader
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CarouselSlider(
                        items: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //color: const Color(0xff7c94b6),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 9.5),
                                child: Text(
                                  "Poem of the Day\n \nThere are only two ways of getting on in the world; by one's own industry,"
                                  " or by the stupidity of others",
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //color: const Color(0xff7c94b6),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 9.5),
                                child: Text(
                                  "Thought of the Day\n\nThere are only two ways of getting on in the world; by one's own industry,"
                                  " or by the stupidity of others",
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //color: const Color(0xff7c94b6),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 9.5),
                                child: Text(
                                  "Quote of the Day\n\nThere are only two ways of getting on in the world; by one's own industry,"
                                  " or by the stupidity of others",
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        //Slider Container properties
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 140.0,
                          enlargeCenterPage: false,
                          aspectRatio: 2.0,
                          autoPlayCurve: Curves.easeIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(
                            milliseconds: 800,
                          ),
                          viewportFraction: 1.0,
                        ),
                      ),

                      /*    CarouselSlider(
                items: [

                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                     Colors.white,
                      Colors.red
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                    child: const Text("There are only two ways of getting on in the world; by one's own industry, "
                        "or by the stupidity of others"),
                  ),

                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: const Text("There are only two ways of getting on in the world; by one's own industry, "
                        "or by the stupidity of others"),
                    */
                      /* decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),

                      image: DecorationImage(
                        image: AssetImage("assets/images/slidepic1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),*/
                      /*
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: const Text("There are only two ways of getting on in the world; by one's own industry, "
                        "or by the stupidity of others"),
                    */
                      /* decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),

                      image: DecorationImage(
                        image: AssetImage("assets/images/slidepic1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),*/
                      /*
                  ),





                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  autoPlayCurve: Curves.easeIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                ),
              ),*/
                      Positioned(
                        bottom: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    // margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 140.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/Books.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ebooksPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            // height: 80,
                            width: 115,
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black,width: 2.0)
                            ),
                            child: Image.asset(
                              "assets/dashboard/courses.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            //  Navigator.push(context,  MaterialPageRoute(builder: (context) => eTopicsPage()));
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/Topics.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => eTopicPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MusicScreen(),
                              ),
                            );
                          },
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/music.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoScreen(),
                              ),
                            );
                          },
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/Video.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/paintings.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaintingScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/Quotation.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuotationScren(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              "assets/dashboard/Symbols.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymbolScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                            // width: 80,
                            child: Image.asset(
                              "assets/dashboard/hindibooks.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => hindibooksPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          child: Text(
                            "Latest e-Books",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ebooksPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            width: 160,
                            height: 200,
                            child: Image.asset(
                              'assets/dashboard/4.jpg',
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ), //BoxDecoration
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ebooksPage(),
                              ),
                            );
                          },
                        ),
                        //Container
                        SizedBox(width: 20), //SizedBox
                        Container(
                          width: 160,
                          height: 200,
                          child: Image.asset(
                            'assets/dashboard/2.jpg',
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle,
                          ), //BoxDecoration
                        ), //Container
                      ], //<Widget>[]
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          child: Text(
                            ""
                            "Latest  Topics",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => eTopicPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 160,
                          height: 200,
                          child: Image.asset(
                            'assets/dashboard/3.jpg',
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ), //BoxDecoration
                        ), //Container
                        SizedBox(width: 20), //SizedBox
                        Container(
                          width: 160,
                          height: 200,
                          child: Image.asset(
                            'assets/dashboard/1.jpg',
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle,
                          ), //BoxDecoration
                        ), //Container
                      ], //<Widget>[]
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          child: Text(
                            ""
                            "Latest  Hindi Books",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hindibooksPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //SizedBox
                        Container(
                          width: 160,
                          height: 200,
                          child: Image.asset(
                            'assets/images/hindicover.jpg',
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle,
                          ), //BoxDecoration
                        ), //Container
                      ], //<Widget>[]
                      // mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          child: Text(
                            "Latest Videos",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedVideo(
                                VideoTopic: videolistResponse[0].VideoTopic,
                                VideoUrl: videolistResponse[0].VideoUrl,
                                VideoTitle: videolistResponse[0].VideoTitle,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          // width: 120,
                          height: 140,
                          child: Image.network(
                            videolistResponse[0].VideoThumbUrl,
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ), //BoxDecoration
                        ),
                      ),
                      //Container
                      SizedBox(width: 20), //SizedBox
                      // GestureDetector(
                      //   onTap: (){
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => DetailedVideo(
                      //           VideoTopic: videolistResponse[1].VideoTopic,
                      //           VideoUrl: videolistResponse[1].VideoUrl,
                      //           VideoTitle: videolistResponse[1].VideoTitle,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   child: Container(
                      //       width: 120,
                      //       height: 140,
                      //       child:Image.network(
                      //         videolistResponse[1].VideoThumbUrl,
                      //         fit: BoxFit.fill,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         //borderRadius: BorderRadius.circular(10),
                      //         shape: BoxShape.circle,
                      //       ) //BoxDecoration
                      //       ),
                      // ) //Container
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(height: 20),
                  Image.asset("assets/images/features.jpg", height: 55),
                  /*  Text("Daily Features",style:TextStyle(
                                          fontFamily: 'Jost',    color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
*/
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoemScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Poem of the Day",
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MantrasScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Daily Sacred Mantras",
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //   Image.asset("assets/dashboard/fe1.png",fit: BoxFit.fill,width: 180,height: 40,),
                      /* Image.asset("assets/dashboard/fe2.png",fit: BoxFit.fill,width: 180,height: 40,),*/
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /*Image.asset("assets/dashboard/fe3.png",fit: BoxFit.fill,width: 180,height: 40,),
                Image.asset("assets/dashboard/fe4.png",fit: BoxFit.fill,width: 180,height: 40,),*/
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyArticleScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Divine Articles of the Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuotationDayScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Divine Quotation of the Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyPrayersScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Daily Prayers",
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyThoughtScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Daily Thought of the Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*Image.asset("assets/dashboard/f5.png",fit: BoxFit.fill,width: 180,height: 40,),
                Image.asset("assets/dashboard/f6.png",fit: BoxFit.fill,width: 180,height: 40,),*/
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyAstroScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Adapt an Astrological Name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SymbolDayScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Sacred Symbol of the Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReligiousDailyScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Daily Religious Verse",
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FamousPoemDayScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 165,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffFADA5E), Colors.amber],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: const Color(0xff7c94b6),
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Famous Poem of the Day",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
