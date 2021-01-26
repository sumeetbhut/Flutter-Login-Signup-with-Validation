import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/bloc/bloc-prov.dart';
import 'package:login_signup_ui_flutter_app/ui/splashscreen/splash-bloc.dart';
import 'package:login_signup_ui_flutter_app/utils/image_utils.dart';

import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashBloc _splashBloc;
  BuildContext globalContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashBloc = SplashBloc();
    _splashBloc.stream.listen((value) {
      Navigator.pushReplacementNamed(context, value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _splashBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return BlocProvider(
      bloc: _splashBloc,
      child: Scaffold(body: Body()),
    );
  }
}
