// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lawexample/pages/profile_page.dart';

import 'contact_page.dart';
import 'feedback_page.dart';

class EnquiryPage extends StatefulWidget {
  @override
  EnquiryPageState createState() => EnquiryPageState();
}

class EnquiryPageState extends State<EnquiryPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Enquiry",
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,

        unselectedLabelStyle: TextStyle(
          fontFamily: 'Jost',
          color: Colors.black,
        ),
        selectedLabelStyle: TextStyle(fontFamily: 'Jost', color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            label: "Enquiry",
            backgroundColor: Colors.blueGrey[500],
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Feedback",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Contact US",
            backgroundColor: Colors.blueGrey[500],
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );

                // Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnquiryPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                );
                //  Navigator.pushNamed(context, 'page3');
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
                break;
            }
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: (50),
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset('assets/images/enquiry.png'),
                  ),
                ),
                Card(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            size: 35,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                0.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Name",
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            Icons.call,
                                            size: 35,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                0.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contact no",
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            Icons.email,
                                            size: 35,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                0.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            Icons.message,
                                            size: 25,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(
                                                0.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,

                                          errorBorder: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffc9880b),
                                        Color(0xfff77f00),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Send Enquiry",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
