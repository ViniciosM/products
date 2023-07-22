import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/core/theme/app_config_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/");
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: AppConfigUI.theme,
    );
  }
}
