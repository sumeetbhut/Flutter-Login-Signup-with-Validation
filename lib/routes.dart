import 'package:flutter/widgets.dart';
import 'package:login_signup_ui_flutter_app/ui/login/login.dart';
import 'package:login_signup_ui_flutter_app/ui/signup/signup.dart';
import 'package:login_signup_ui_flutter_app/ui/splashscreen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => SplashScreen(),
  "/login" : (BuildContext context) => LoginPage(),
  "/signup" : (BuildContext context) => SignupPage(),
};
