import 'package:flutter/material.dart';
import 'package:lawexample/Model/PaintingDescModel.dart';
import 'package:lawexample/api_manager/api_response.dart';

import '../full_image.dart';

class PaintingDescription extends StatefulWidget {
  final String PaintingTopic;

  const PaintingDescription({Key? key, required this.PaintingTopic})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaintingDescriptionState();
  }
}

class PaintingDescriptionState extends State<PaintingDescription> {
  List<PaintingDescModel> paintingDesclistresponse = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    paintingDesclistresponse = await ApiManager().ListPaintingDesc(
      widget.PaintingTopic,
    );
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
            " Divine Paintings",
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
            child: paintingDesclistresponse.isNotEmpty
                ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 1.8,
                          crossAxisCount: 2,
                          mainAxisExtent: 290,

                          // here set custom Height You Want
                          childAspectRatio: 1.0,
                        ),
                    itemCount: paintingDesclistresponse.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenPage(
                                url: paintingDesclistresponse[i].PaintingUrl,
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
                                    Text(
                                      '\n${paintingDesclistresponse[i].SubTopic}',
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
                                    Container(
                                      child: Image.network(
                                        paintingDesclistresponse[i]
                                            .PaintingUrl!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 150,
                                      ),
                                    ),
                                    Text(
                                      '\n${paintingDesclistresponse[i].PaintingDesc}',
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
                                  ],
                                ),
                              ],
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
