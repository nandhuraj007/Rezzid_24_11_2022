import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezzid/screens/home/profile/settings/thems/model_theme.dart';
import 'package:rezzid/screens/login/loginpage.dart';
import 'package:rezzid/screens/routingPage.dart' as route;
import 'package:flutter/foundation.dart';

void main() {
  runApp(
     MyApp(),
    );
}
class MyApp extends StatelessWidget {
  final apptitle="Rezzid";
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
            return MaterialApp(
              theme: themeNotifier.isDark
                  ? ThemeData(
                brightness: Brightness.dark,
              )
                  : ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.brown,
                  primaryColor: Colors.brown
              ),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: route.controllers,//initialRoute: route.homePage,
                home: Login()
            );
           }
          ),
    );
    // return MaterialApp(
    //
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //         brightness: Brightness.dark,
    //         primarySwatch: Colors.brown,
    //         primaryColor: Colors.brown
    //     ),
    //     onGenerateRoute: route.controllers,//initialRoute: route.homePage,
    //     home: SplashScreenPage()
    // );
  }
}
