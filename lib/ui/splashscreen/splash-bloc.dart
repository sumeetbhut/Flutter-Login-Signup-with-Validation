import 'dart:async';

import 'package:login_signup_ui_flutter_app/bloc/bloc.dart';

class SplashBloc extends Bloc {
  Stream<String> get stream => splashController.stream;

  Sink<String> get streamSink => splashController.sink;

  final StreamController<String> splashController = StreamController<String>();

  SplashBloc() {
    Timer(Duration(seconds: 2), () {
      splashController.add('/login');
    });
  }

  void dispose() {
    splashController.close();
  }
}
