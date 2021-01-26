import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_signup_ui_flutter_app/utils/color-utils.dart';
import 'package:login_signup_ui_flutter_app/utils/image_utils.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: ColorUtils.appColor,
          title: new Text('Home'),
        ),
        body: Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[

            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
