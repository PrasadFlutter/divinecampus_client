import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lawexample/api_manager/api_response.dart';
import 'package:lawexample/components/background.dart';

import '../common/theme_helper.dart';
import 'profile_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Image.asset("assets/images/reg.jpg", width: 130, height: 170),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // SizedBox(height: 5,),
                            Center(
                              child: Text(
                                'Registration',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              // height: 40,
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your First Name";
                                  }
                                  return null;
                                },
                                controller: firstNameController,
                                decoration: ThemeHelper().textInputDecoration(
                                  'First Name',
                                  'Enter your first name',
                                ),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 10),
                            Container(
                              // height: 40,
                              child: TextFormField(
                                controller: lastNameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your Last Name";
                                  }
                                  return null;
                                },
                                decoration: ThemeHelper().textInputDecoration(
                                  'Last Name',
                                  'Enter your last name',
                                ),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: TextFormField(
                                controller: emailIDController,
                                decoration: ThemeHelper().textInputDecoration(
                                  "E-mail address",
                                  "Enter your email",
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your EmailId";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: TextFormField(
                                controller: mobileNoController,
                                decoration: ThemeHelper().textInputDecoration(
                                  "Mobile Number",
                                  "Enter your mobile number",
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your MobileNo";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                  "Password*",
                                  "Enter your password",
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 10.0),
                            FormField<bool>(
                              builder: (state) {
                                return Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValue = value!;
                                              state.didChange(value);
                                            });
                                          },
                                        ),
                                        Text(
                                          "I accept all terms and conditions.",
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.errorText ?? '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              validator: (value) {
                                if (!checkboxValue) {
                                  return 'You need to accept terms and conditions';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            // SizedBox(height: 10.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(
                                context,
                              ),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    40,
                                    10,
                                    40,
                                    10,
                                  ),
                                  child: Text(
                                    "Register".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please wait ..."),
                                      ),
                                    );
                                    String response = await ApiManager()
                                        .InsertRegistration(
                                          firstNameController.text,
                                          lastNameController.text,
                                          emailIDController.text,
                                          mobileNoController.text,
                                          passwordController.text,
                                        );
                                    if (response == "1") {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Registration Successfull.",
                                          ),
                                        ),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfilePage(),
                                        ),
                                      );
                                      //print("Successfull");
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Something Went Wrong!.",
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Or create account using social media",
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.googlePlus,
                                    size: 35,
                                    color: HexColor("#EC2D2F"),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog(
                                            "Google Plus",
                                            "You tap on GooglePlus social icon.",
                                            context,
                                          );
                                        },
                                      );
                                    });
                                  },
                                ),
                                SizedBox(width: 30.0),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 5,
                                        color: HexColor("#40ABF0"),
                                      ),
                                      color: HexColor("#40ABF0"),
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      size: 23,
                                      color: HexColor("#FFFFFF"),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog(
                                            "Twitter",
                                            "You tap on Twitter social icon.",
                                            context,
                                          );
                                        },
                                      );
                                    });
                                  },
                                ),
                                SizedBox(width: 30.0),
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 35,
                                    color: HexColor("#3E529C"),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog(
                                            "Facebook",
                                            "You tap on Facebook social icon.",
                                            context,
                                          );
                                        },
                                      );
                                    });
                                  },
                                ),
                              ],
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
