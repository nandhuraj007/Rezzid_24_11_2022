import 'package:flutter/material.dart';
import 'package:rezzid/screens/routingPage.dart' as route;

class Accountsettings extends StatefulWidget {
  const Accountsettings({Key? key}) : super(key: key);
  @override
  State<Accountsettings> createState() => _AccountsettingsState();
}
class _AccountsettingsState extends State<Accountsettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Update Password",
            style: TextStyle(color: Colors.white),
          ),
          shadowColor: Colors.redAccent,
          flexibleSpace: InkWell(
            child: Container(
              
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.teal, Colors.tealAccent])
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, route.updatePassword);

            },
          )
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.lock_open_outlined,
                color: Colors.teal.shade600,),
              title: Text("Change Your Password"),
              onTap: (){
                Navigator.pushNamed(context, route.updatePassword);
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.warning_outlined,
            color: Colors.teal.shade600,),
            title: Text("Delete Account"),
            onTap: (){
              Navigator.pushNamed(context, route.deleteacount);
            },
          ),
          ),
        ],
      ),
    );
  }
}
