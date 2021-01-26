import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/utils/color-utils.dart';
import 'package:login_signup_ui_flutter_app/utils/image_utils.dart';
import 'package:login_signup_ui_flutter_app/utils/string-utils.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildLogoImageField() => Hero(
      tag: 'splash',
      child: Image.asset(
        ImageUtils.appLogo,
        height: 300.0,
        width: 300.0,
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildLogoImageField(),
            /*Text(
              StringUtils.appName,
              style: TextStyle(color: ColorUtils.greenColor, fontSize: 40.0, fontFamily: 'Belleza'),
            ),*/
          ],
        ),
      ),
      //backgroundColor: ColorUtils.bgColor,
    );
  }
}