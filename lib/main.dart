import 'package:flutter/material.dart';
import 'package:login_signup_ui_flutter_app/routes.dart';
import 'package:login_signup_ui_flutter_app/theme/style.dart';
import 'package:login_signup_ui_flutter_app/utils/lifecucle-manager.dart';
import 'package:login_signup_ui_flutter_app/utils/string-utils.dart';

import 'bloc/bloc-prov-tree.dart';
import 'bloc/bloc-prov.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProviderTree(
      blocProviders: <BlocProvider>[],
      child: LifeCycleManager(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringUtils.appName,
            theme: appTheme(),
            initialRoute: '/',
            routes: routes),
      ),
    );
  }
}
