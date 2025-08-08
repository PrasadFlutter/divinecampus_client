// ignore_for_file: unused_field, deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/pages/profile_page.dart';

import 'ebooks_page.dart';

class ContactPage extends StatefulWidget {
  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentindex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Contact Us",
            style: TextStyle(
              fontFamily: 'Jost',
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(decoration: BoxDecoration()),
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
        initialActiveIndex: 3,
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: (50),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset('assets/images/splash/divlogo.PNG'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Divine Campus',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'R-257 , Lower Ground Floor Greater Kailsah - I New Delhi- 110048 \n \n URL:        http://divinecampus.com',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),

                    //   Image.asset('assets/images/splash/logo.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
