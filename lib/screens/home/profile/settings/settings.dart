import 'package:flutter/material.dart';
import 'package:rezzid/screens/routingPage.dart' as route;

import 'package:rezzid/screens/home/profile/settings/thems/changeTheme.dart';
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}
class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "REZZID",
            style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = LinearGradient(
                  colors: <Color>[
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.red
                  ],
                ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 100.0))
            ),
            //style: TextStyle(color: Colors.white),
          ),
          shadowColor: Colors.redAccent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.teal, Colors.tealAccent])),
          )
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(Icons.manage_accounts,
                color: Colors.teal.shade600,),
              title: Text(
                'Account',
                //textScaleFactor: 10,
              ),
              onTap: (){
                Navigator.pushNamed(context, route.accountSettings);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(Icons.notifications,
                color: Colors.teal.shade600,),
              title: Text(
                'Notifications',
                //textScaleFactor: 10,
              ),
              onTap: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(Icons.chat_bubble_outline_sharp,
                color: Colors.teal.shade600,),
              title: Text(
                'Themes',
                //textScaleFactor: 10,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemePage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(Icons.question_mark,
                color: Colors.teal.shade600,),
              title: Text(
                'About',
                //textScaleFactor: 10,
              ),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}
