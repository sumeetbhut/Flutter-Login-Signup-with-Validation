import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/animation/FadeAnimation.dart';
import 'package:login_signup_ui_flutter_app/ui/signup/signup.dart';
import 'package:login_signup_ui_flutter_app/ui/home/home.dart';
import 'package:login_signup_ui_flutter_app/utils/color-utils.dart';
import 'package:login_signup_ui_flutter_app/utils/validation-util.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(title: ''),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  var _validationUtil = ValidationUtil();
  final _formKey = GlobalKey<FormState>();
  final _textUserName = TextEditingController();
  final _textPassword = TextEditingController();

  bool _validateUserName = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.2,
                          makeInput(_validateUserName, _textUserName,
                              'Please enter Username',
                              label: "Username")),
                      FadeAnimation(
                          1.3,
                          makeInput(_validatePassword, _textPassword,
                              'Please enter Password',
                              label: "Password", obscureText: true)),
                    ],
                  ),
                  FadeAnimation(
                      1.4,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                            //checkAndSave();
                          },
                          color: ColorUtils.appColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      )),
                  FadeAnimation(
                      1.6,
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account?"),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ],
                          ))),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      bool _validate, TextEditingController controller, String message,
      {label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: (value) => _validationUtil.validateField(value, message),
          decoration: InputDecoration(
            errorText: _validate ? message : null,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
