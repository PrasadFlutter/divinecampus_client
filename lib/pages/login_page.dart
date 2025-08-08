import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/Model/LoginModel.dart';
import 'package:lawexample/components/background.dart';
import '../api_manager/api_response.dart';
import '../common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            children: [
              /*Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded,"assets/images/splash/divlogo.PNG"), //let's create a common header widget
            ),*/
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/images/splash/applogo.png",
                          ),
                        ),
                      ),
                      /*     Text(
                          'Divine Campus',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: HexColor('#2B60DE')),
                        ),*/
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Limitless Devotion To God',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Sign in into your account',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                controller: mobController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your MobileNo";
                                  }
                                  return null;
                                },
                                decoration: ThemeHelper().textInputDecoration(
                                  'Mobile Number',
                                  'Enter your mobile no',
                                ),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              child: TextFormField(
                                controller: passwordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your Password";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Password',
                                  'Enter your password',
                                ),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 10.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(
                                  10,
                                  0,
                                  10,
                                  20,
                                ),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                      color: Colors.brown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(
                                context,
                              ),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Sign In'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  if (_formKey.currentState!.validate()) {
                                    //  List<LoginModel> loginlistresponse = [];
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please wait...."),
                                      ),
                                    );
                                    List<LoginModel> loginlistresponse =
                                        await ApiManager().Login(
                                          mobController.text,
                                          passwordController.text,
                                        );
                                    if (loginlistresponse.isNotEmpty) {
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
                                            "Please enter correct credentials ",
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Don\'t have an account? ",
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        color: Colors.brown,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationPage(),
                                            ),
                                          );
                                        },
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
