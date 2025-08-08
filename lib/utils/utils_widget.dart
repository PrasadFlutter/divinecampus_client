import 'package:flutter/material.dart';

class UtilsDialog {
  static showTakeTourDialog(
    BuildContext context, {
    Function(int)? onYesPressed,
  }) {
    // Widget closeButton = UtilsButton.fullSizeButton(
    //   'Close',
    //   onButtonPressed: (value) {
    //     dismissAlertDialog(context);
    //     onYesPressed!(1);
    //   },
    // );

    // set up the AlertDialog
    Dialog alert = Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 24.0,
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Take A Virtual Tour',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          /*   dismissAlertDialog(context);
                    onYesPressed!(1);*/
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /*const Text(
                'Take A Virtual Tour',
                style: TextStyle(
                    color: UtilsStyle.appTitleDarkColor,
                    fontSize: textMedium,
                    fontWeight: FontWeight.bold),
              ),*/
              SizedBox(height: 15),

              /* Container(
                  padding: const EdgeInsets.all(10),
                  height: 250,
                  child: const Center(child:
                  */
              /*WebView(
                    initialUrl: 'https://flutter.dev',
                  )*/
              /*

                  )),*/
            ],
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
