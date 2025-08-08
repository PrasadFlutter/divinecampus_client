import 'package:flutter/material.dart';

class FullScreenPage extends StatelessWidget {
  final String?  url;

   FullScreenPage({
    Key? key,
    required this.url,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(url??""),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }
}