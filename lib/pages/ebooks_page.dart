import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/api_manager/api_response.dart';
import 'package:lawexample/pages/profile_page.dart';

import '../Model/BookModel.dart';
import 'contact_page.dart';
import 'detailed_ebook_screen.dart';

class ebooksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ebooksPageState();
  }
}

class ebooksPageState extends State<ebooksPage> {
  List<BookModel> booklistresponse = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    booklistresponse = await ApiManager().GetBookDetails();
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
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: const Color(0xffe00040),
          ),
        ),
        title: Center(
          child: Text(
            " Divine e-Books",
            //  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            style: TextStyle(
              fontFamily: 'Jost',
              color: const Color(0xffe00040),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            /*         gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )*/
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        color: const Color(0xffe00040),

        // curve: Cu,
        // top: ,
        height: 50,
        style: TabStyle.fixedCircle,
        activeColor: Colors.pink[300],

        backgroundColor: Colors.pink[50],
        items: [
          const TabItem(icon: Icons.home, title: "Home"),
          const TabItem(icon: Icons.book_outlined, title: 'Books'),
          TabItem(
            icon: Image.asset(
              "assets/images/splash/splashlogo.png",
              width: 30,
              height: 30,
            ),
          ),
          const TabItem(icon: Icons.call, title: 'Contact'),
          const TabItem(
            icon: Icons.format_align_justify_rounded,
            title: 'More',
          ),
        ],
        initialActiveIndex: 1,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 4, top: 5),
            child: booklistresponse.isNotEmpty
                ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 1.8,
                          crossAxisCount: 2,
                          mainAxisExtent:
                              270, // here set custom Height You Want

                          childAspectRatio: 1.0,
                        ),
                    itemCount: booklistresponse.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedebooksPage(
                                BookName: booklistresponse[i].BookFullName,
                                BookImage: booklistresponse[i].BookImgUrl,
                                BookPrice: booklistresponse[i].BookPrice,
                                BookPdfURl: booklistresponse[i].BookShortPdfUrl,
                                BookAmazonURL:
                                    booklistresponse[i].BookAmazonUrl,
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
                                        booklistresponse[i].BookImgUrl,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 140,
                                      ),
                                    ),

                                    Text(
                                      '\n${booklistresponse[i].BookFullName}',
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
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
