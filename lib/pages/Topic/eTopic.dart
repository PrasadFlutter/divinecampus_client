//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:lawexample/Model/BookTopicModel.dart';
import 'package:lawexample/api_manager/api_response.dart';

import 'detailed_eTopic.dart';

class eTopicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return eTopicPageState();
  }
}

class eTopicPageState extends State<eTopicPage> {
  List<BookTopicModel> topiclistresponse = [];
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    topiclistresponse = await ApiManager().GetTopicDetails();
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
            " Divine e-Topics",
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            /*         gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )*/
          ),
        ),
      ),
      /*    bottomNavigationBar: ConvexAppBar(
          controller: _tabController,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
            child: topiclistresponse.isNotEmpty
                ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 1.8,
                          crossAxisCount: 2,
                          mainAxisExtent:
                              280, // here set custom Height You Want

                          childAspectRatio: 1.0,
                        ),
                    itemCount: topiclistresponse.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedebooksTopicPage(
                                BookName:
                                    topiclistresponse[i].BookTopicFullName,
                                BookImage: topiclistresponse[i].BookTopicImgUrl,
                                BookPrice: topiclistresponse[i].BookTopicPrice,
                                BookPdfURl:
                                    topiclistresponse[i].BookTopicShortPdfUrl,
                                BookAmazonURL:
                                    topiclistresponse[i].BookTopicAmazonUrl,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            // height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.network(
                                        topiclistresponse[i].BookTopicImgUrl,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 150,
                                      ),
                                    ),

                                    Text(
                                      '\n${topiclistresponse[i].BookTopicFullName}',
                                      maxLines: 4,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 14,
                                        //// fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '~ Shree Ananda Krishna',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 13,
                                            color: Colors.red,
                                            //// fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],

                              /*  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 264,
            ),*/
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
