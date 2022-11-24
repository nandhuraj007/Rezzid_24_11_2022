import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

import 'model_theme.dart';
class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);
  @override
  ThemePageState createState() => ThemePageState();
}
class ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return Scaffold(
            appBar: AppBar(
                actionsIconTheme: IconThemeData(
                    color: Colors.pink.shade900,
                    size: 36),
                shadowColor: Colors.redAccent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Colors.teal, Colors.tealAccent])
                  ),
                )
            ),
            body:
            Center(
                child: Center(
                  child: Container(
                    child: IconButton(onPressed: (){
                      themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                    },
                        iconSize: 60,
                        disabledColor: Colors.teal,
                        icon: Icon(Icons.nights_stay,color: Colors.pink)
                    ),
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                    shape: BoxShape.circle
                  ),

              ),
            ),
            ));
        });
  }
}