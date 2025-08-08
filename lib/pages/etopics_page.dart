
import 'package:flutter/material.dart';

class eTopicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return eTopicsPageState();
  }
}

class eTopicsPageState extends State<eTopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Divine Topics",
                //  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                style:TextStyle(
                                          fontFamily: 'Jost',    
                    color: Colors.blue, fontWeight: FontWeight.bold)),
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
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        physics: ScrollPhysics(),
        //  padding: const EdgeInsets.symmetric(horizontal: 30),
          //   itemCount: 4,
          children: <Widget>[
            Card(
              child: Container(
               // height: 400,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'The Divine Dialouge',
                          style: TextStyle(
                            fontSize: 13,
                            //// fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author- Shree Ananda Krishna',
                              style: TextStyle(
                                color: Colors.blueGrey,
                               // // fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
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
            Card(
              child: Container(
                height: 290,
                width: 300,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e2.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Wisdom of the Forest',
                          style: TextStyle(
                            fontSize: 13,
                         //   // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author- Shree Ananda Krishna',
                              style: TextStyle(
                              //  // fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],


                ),
              ),
            ),
            Card(
              child: Container(
                height: 290,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e3.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Decoding the Ancient Wisdom',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
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
            Card(
              child: Container(
                height: 290,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e4.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Mystic Secrets of a Yogi',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 290,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e5.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Prayer of the Angels',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
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
            Card(
              child: Container(
                height: 350,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e6.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Entering the Secret Gate',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
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
            Card(
              child: Container(
                height: 290,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e7.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Travelling Along the Mystical Path',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
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
            Card(
              child: Container(
                height: 290,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/e8.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Tasting the Divine Romance',
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Author - Shree Ananda Krishna',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
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
          ]),
    ))));
  }
}
