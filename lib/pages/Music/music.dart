//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lawexample/Model/MusicModel.dart';
import 'package:lawexample/api_manager/api_response.dart';
import 'package:lawexample/pages/Music/DetailedMusic.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MusicScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MusicScreenState();
  }
}

class MusicScreenState extends State<MusicScreen> {
  List<MusicModel> musiclistresponse = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    musiclistresponse = await ApiManager().GetMusicDetails();
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
            " Divine Music",
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
        initialActiveIndex: 2, //optional, default as 0
        //  onTap: (int i) => print('click index=$i'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
          child: musiclistresponse.isNotEmpty
              ? ListView.builder(
                  itemCount: musiclistresponse.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    double c_width = MediaQuery.of(context).size.width * 0.8;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedMusic(
                              MusicTitle: musiclistresponse[i].MusicTitle,
                              MusicTopic: musiclistresponse[i].MusicTopic,
                              MusicThumbUrl: musiclistresponse[i].MusicThumbUrl,
                              MusicUrl: musiclistresponse[i].MusicUrl,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              '\n${musiclistresponse[i].MusicTitle}',

                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontSize: 15,
                                //// fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
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
                                      musiclistresponse[i].MusicThumbUrl,
                                      fit: BoxFit.fill,
                                    ),
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.5),
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
                                          musiclistresponse[i].MusicStatusText,
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 13,
                                            color: Colors.red,
                                            //// fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          musiclistresponse[i]
                                              .MusicCreatedOn106,
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 13,
                                            color: Colors.blue,
                                            //// fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
