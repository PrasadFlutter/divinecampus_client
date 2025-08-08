// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:lawexample/Model/SymbolTopicModel.dart';
import 'package:lawexample/api_manager/api_response.dart';

class SymbolDescription extends StatefulWidget {
  final String SymbolTopic;

  const SymbolDescription({Key? key, required this.SymbolTopic})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SymbolDescriptionState();
  }
}

class SymbolDescriptionState extends State<SymbolDescription> {
  List<SymbolDescriptionBytopic> SymbolDescription = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    SymbolDescription = await ApiManager().ListSymbolByTopic(
      widget.SymbolTopic,
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
            " Divine Symbol",
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
        flexibleSpace: Container(decoration: BoxDecoration()),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 4, top: 5),
          child: SymbolDescription.isNotEmpty
              ? ListView.builder(
                  itemCount: SymbolDescription.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    double c_width = MediaQuery.of(context).size.width * 0.8;

                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Symbol Code: ${SymbolDescription[i].symbolCode!}',

                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(width: 10),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                SymbolDescription[i].symbolName!,
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 13,
                                  color: Colors.black,
                                  //// fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    SymbolDescription[i].symbolimgUrl!
                                        .replaceAll("'", ""),
                                    fit: BoxFit.fill,
                                    width: 150,
                                    height: 170,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${SymbolDescription[i].symbolDesc!.replaceAll("</br>", "")}',
                                    maxLines: 22,
                                    // softWrap: true,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Jost',

                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            /*           Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    SymbolDescription[i].symbolDesc!.replaceAll("</br>", ""),
                                    style:  TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 13, color: Colors.black
                                      //// fontWeight: FontWeight.bold,
                                    )),
                                ),*/
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Text(
                                SymbolDescription[i].symbolUrl!,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,

                                  //// fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              /*GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 1.8,
                        crossAxisCount: 2,
                        mainAxisExtent: 290,
                        // here set custom Height You Want

                        childAspectRatio: 1.0),
                    itemCount: SymbolDescription.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Container(
                            // height: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\n Quotation ${SymbolDescription[i].quotationID}',
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

                                    Text(
                                      '\n${SymbolDescription[i].quotationTopic}',
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })*/
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
