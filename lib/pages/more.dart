// ignore_for_file: deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lawexample/pages/contact_page.dart';
import 'package:lawexample/pages/ebooks_page.dart';
import 'package:lawexample/pages/profile_page.dart';
import 'package:lawexample/pages/registration_page.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "Registration",
        "route": "registration",
        "icon": Icons.app_registration,
      },
      {"title": "About Us", "route": "about", "icon": Icons.info_outline},
      {"title": "Contact Us", "route": "contact", "icon": Icons.phone_outlined},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "More",
          style: TextStyle(
            fontFamily: 'Jost',
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.blue),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 3,
              shadowColor: Colors.grey.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: Icon(
                  item["icon"] as IconData,
                  color: Colors.blue,
                  size: 28,
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
                  if (item["route"] == "registration") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(),
                      ),
                    );
                  } else if (item["route"] == "about") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WebViewScreen(
                          url:
                              "https://divinecampus.com/aboutdivinecampus.aspx",
                          title: "About Us",
                        ),
                      ),
                    );
                  } else if (item["route"] == "contact") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WebViewScreen(
                          url:
                              "https://divinecampus.com/contactDevinecampus.aspx",
                          title: "Contact Us",
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: InAppWebView(initialUrlRequest: URLRequest(url: WebUri(url))),
    );
  }
}
