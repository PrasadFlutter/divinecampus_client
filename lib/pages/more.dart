// ignore_for_file: deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/pages/about_us_page.dart';
import 'package:lawexample/pages/contact_page.dart';
import 'package:lawexample/pages/ebooks_page.dart';
import 'package:lawexample/pages/profile_page.dart';
// import 'package:lawexample/pages/registration_page.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      // {
      //   "title": "Registration",
      //   "icon": Icons.app_registration,
      //   "isPage": true,
      //   "page": (context) => RegistrationPage(),
      // },
      {
        "title": "About Us",
        "icon": Icons.info_outline,
        "isPage": true,
        "page": (context) => const AboutUsPage(),
      },
      // {
      //   "title": "Contact Us",
      //   "icon": Icons.phone_outlined,
      //   "url": "https://divinecampus.com/contactDevinecampus.aspx",
      // },
      // {
      //   "title": "Religion",
      //   "icon": Icons.account_balance,
      //   "url": "https://divinecampus.com/Religion/Home.aspx",
      // },
      // {
      //   "title": "Spiritual",
      //   "icon": Icons.self_improvement,
      //   "url": "https://divinecampus.com/spritual/Home.aspx",
      // },
      // {
      //   "title": "Greetings",
      //   "icon": Icons.card_giftcard,
      //   "url": "https://divinecampus.com/Greetings/Home.aspx",
      // },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "More",
          style: TextStyle(
            fontFamily: 'Jost',
            color: Color(0xffe00040),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Color(0xffe00040)),
      ),
      bottomNavigationBar: ConvexAppBar(
        color: const Color(0xffe00040),
        height: 50,
        style: TabStyle.fixedCircle,
        activeColor: Colors.pink[400],
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
        initialActiveIndex: 4,
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
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
          }
          if (i == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoreOptionsScreen(),
              ),
            );
          }
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade50, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.shade100),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/splash/splashlogo.png"),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore More",
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffe00040),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Quick access to app information and extra sections",
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(items.length, (index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                shadowColor: Colors.black.withOpacity(0.08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      item["icon"] as IconData,
                      color: const Color(0xffe00040),
                      size: 22,
                    ),
                  ),
                  title: Text(
                    item["title"].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jost',
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    if (item["isPage"] == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: item["page"] as WidgetBuilder,
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
