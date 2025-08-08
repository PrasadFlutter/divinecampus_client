import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawexample/Model/VideoModel.dart';
import 'package:lawexample/api_manager/api_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoScreenState();
  }
}

class VideoScreenState extends State<VideoScreen> {
  List<VideoModel> videolistResponse = [];
  int selectedType = 0;
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    callapi("FULL");
  }

  callapi(String type) async {
    videolistResponse = await ApiManager().GetVideoDetails(type);
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
            " Divine e-Videos",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),

                  buildIconTextRow(0, "Latest"),
                  SizedBox(width: 10),
                  buildIconTextRow(1, "Popular"),
                  SizedBox(width: 10),
                  buildIconTextRow(2, "Short Videos"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
                child: videolistResponse.isNotEmpty && selectedType != 2
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: videolistResponse.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              /*          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedVideo(
                              VideoTopic: videolistResponse[i].VideoTopic,
                              VideoUrl: videolistResponse[i].VideoUrl,
                              VideoTitle: videolistResponse[i].VideoTitle,
                            ),
                          ),
                        );*/
                            },
                            child: YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                    videolistResponse[i].VideoUrl,
                                  )!,
                                  flags: const YoutubePlayerFlags(
                                    mute: false,
                                    loop: false,
                                    autoPlay: false,
                                  ),
                                ),
                              ),
                              builder: (context, player) => Column(
                                children: [
                                  SizedBox(height: 10),
                                  player,
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : videolistResponse.isNotEmpty && selectedType == 2
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: videolistResponse.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedVideo(
                              VideoTopic: videolistResponse[i].VideoTopic,
                              VideoUrl: videolistResponse[i].VideoUrl,
                              VideoTitle: videolistResponse[i].VideoTitle,
                            ),
                          ),
                        );*/
                            },
                            child: YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                    videolistResponse[i].VideoUrl,
                                  )!,
                                  flags: const YoutubePlayerFlags(
                                    mute: false,
                                    loop: false,
                                    autoPlay: false,
                                  ),
                                ),
                              ),
                              builder: (context, player) => Column(
                                children: [
                                  SizedBox(height: 10),
                                  player,
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
              ),

              /* Padding(
                    padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
                    child: videolistResponse.isNotEmpty
                        ?
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,

                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 1.8,
                            crossAxisCount: 2,
                            mainAxisExtent: 290, // here set custom Height You Want

                            childAspectRatio: 1.0
                        ),
                        itemCount: videolistResponse.length,
                        itemBuilder: (context, i) {

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailedVideo(
                                        VideoTopic: videolistResponse[i]
                                            .VideoTopic,
                                        VideoUrl: videolistResponse[i]
                                            .VideoUrl,
                                        VideoTitle: videolistResponse[i]
                                            .VideoTitle,
                                      )));
                            },
                            child:  Card(
                              child: Container(
                                // height: 500,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child:  Image.network(
                                            videolistResponse[i].VideoThumbUrl,
                                            fit: BoxFit.fill,
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),

                                        Text(
                                          '\n${videolistResponse[i].VideoTitle}',
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
                                        */
              /*  Text(Vi,
                                            style:TextStyle(
                                            fontFamily: 'Jost',
                                                fontSize: 13, color: Colors.red
                                              //// fontWeight: FontWeight.bold,
                                            ))*/
              /*
                                      ],
                                    ),
                                  ],

                                  */
              /*  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 264,
            ),*/
              /*
                                ),
                              ),
                            ),
                          );
                        })
                        : Center(
                      child: CircularProgressIndicator(),
                    ))*/
            ],
          ),
        ),

        /* Padding(
                padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
                child: videolistResponse.isNotEmpty
                    ? ListView.builder(
                        itemCount: videolistResponse.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          double c_width =
                              MediaQuery.of(context).size.width * 0.8;

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailedVideo(
                                          VideoTopic: videolistResponse[i]
                                              .VideoTopic,
                                          VideoUrl: videolistResponse[i]
                                              .VideoUrl,
                                          VideoTitle: videolistResponse[i]
                                              .VideoTitle,
                                      )));
                            },
                            child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '\n${videolistResponse[i].VideoTitle}',
                                    style:TextStyle(
                                          fontFamily: 'Jost',    
                                      fontSize: 14,
                                      //// fontWeight: FontWeight.bold,
                                    ),
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
                                              width: 3.0), // Set border width
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                          // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))] // Make rounded corner of border
                                        ),
                                        child: Image.network(
                                          videolistResponse[i].VideoThumbUrl,
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
                                                width: 3.0), // Set border width
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),

                                            // Set rounded corner radius
                                            // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.white,offset: Offset(1,3))] // Make rounded corner of border
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(videolistResponse[i].VideoTopic,
                                                  style:TextStyle(
                                          fontFamily: 'Jost',    
                                                      fontSize: 12,
                                                      color: Colors.red
                                                      //// fontWeight: FontWeight.bold,
                                                      )),
                                              SizedBox(height: 5,),
                                              Text(
                                                'View Detail',
                                                style:TextStyle(
                                          fontFamily: 'Jost',    
                                                    fontSize: 13,
                                                    color: Colors.blue
                                                    //// fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      ))*/
      ),
    );
  }

  Widget buildIconTextRow(int type, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("selectedType");
          print("selectedType$type");
          if (type == 2) {
            videolistResponse.clear();
            callapi("SHORT");
            setState(() {});
          } else if (type == 0) {
            videolistResponse.clear();
            callapi("FULL");
            setState(() {});
          }

          selectedType = type;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedType == type ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: selectedType == type ? Colors.white : Colors.red,
              fontFamily: GoogleFonts.jost().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
