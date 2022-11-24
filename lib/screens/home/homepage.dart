import 'dart:convert';
//import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rezzid/screens/home/profile/ask/askForHelp.dart';
import '../login/SignUp/optionMenu.dart';
import 'Chats.dart';
import 'Groups.dart';
import 'Trending.dart';
import 'myGroups.dart';
import 'newGroups.dart';
import 'package:rezzid/screens/routingPage.dart' as route;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key,required String this.title}) : super(key: key);
  final String title;
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  List<String> name = [];
  List<String> email = [];
  bool isLoading = true;
  int count=0;
  String? finalName,finalEmail;
  var currentIndex = 0;
  final pages = [
    const ChatPage(),
    const GroupsPage(),
    const Trending(),
    const Options(),
  ];
  void initState(){
    super.initState();
    readData();
  }
  Future<void>readData()async{
    var url="https://community-eea17-default-rtdb.firebaseio.com/"+"register.json";
    try{
      final response=await http.get(Uri.parse(url));
      final extracteddata=json.decode(response.body) as Map<String, dynamic>;
      if(extracteddata==null){
        return;
      }
      extracteddata.forEach((id, blogData) {
        name.add(blogData["Name"]);
        email.add(blogData["Email"]);
        finalName=name.last;
        finalEmail=email.last;
      });
      setState(() {
        isLoading=false;
      });
    }catch(error){
      throw error;
    }
  }
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(
        widget.title,
        style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = const LinearGradient(
      colors: <Color>[
        Colors.pinkAccent,
        Colors.deepPurpleAccent,
        Colors.red
      ],
         ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 100.0))
        ),
       ),
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
        body:ListView.builder(
            itemCount: 80,
            itemBuilder: (BuildContext context, int index) {
              return GFCard(
                elevation: 60,

                boxFit: BoxFit.cover,
                  gradient: const LinearGradient(
                      colors: [Colors.green, Colors.blue]),
                  image: Image.asset('assets/images/index2.jpeg'),
                title: const GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: AssetImage('assets/images/index2.jpeg'),
                    child: Padding(
                      padding: EdgeInsets.only(left: 32,top:32),
                      child: Icon(Icons.verified_user,color: Colors.pink,),
                    ),
                  ),
                  title: Text('John',style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
                  subTitle: Text('Flutter Developer'),
                ),
                content: const Text("Some quick example text to build on the card"),
                borderRadius: BorderRadius.circular(18),
                buttonBar: GFButtonBar(
                  children: <Widget>[
                    IconButton(onPressed: (){},
                        iconSize: 30,
                        visualDensity: VisualDensity(horizontal: 3,vertical: 2),
                        icon: Icon(Icons.thumbs_up_down,color: Colors.pink,)
                    ),
                    IconButton(onPressed: (){},
                        iconSize: 30,
                        visualDensity: VisualDensity(horizontal: 3,vertical: 2),
                        icon: Icon(Icons.favorite_rounded,color: Colors.pink,)
                    ),
                    IconButton(onPressed: (){},
                        iconSize: 30,
                        visualDensity: VisualDensity(horizontal: 3,vertical: 2),
                        icon: Icon(Icons.add_comment,color: Colors.pink,)
                    ),
                    IconButton(onPressed: (){},
                        iconSize: 30,
                        icon: Icon(Icons.share_outlined,color: Colors.pink)
                    ),
                    IconButton(onPressed: (){},
                        iconSize: 30,
                        icon: Icon(Icons.save_alt_rounded,color: Colors.pink)
                    )
                  ],
                ),

              );
            }),

      endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
               UserAccountsDrawerHeader(
                accountName:  Text("$finalName"),
                accountEmail: Text("$finalEmail"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.teal,
                ),),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.account_circle,
                  color: Colors.teal.shade600,),
                title: Text("Profile"),
                hoverColor: Colors.teal,
                onTap: () {
                  Navigator.pushNamed(context, route.profiles);
                },
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.settings,
                  color: Colors.teal.shade600,),
                title: Text("Settings"),
                hoverColor: Colors.teal,
                onTap: () {
                  Navigator.pushNamed(context, route.basicSettings);
                },
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.contact_phone,
                  color: Colors.teal.shade600,),
                title: Text("Ask"),
                hoverColor: Colors.teal,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Ask()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.group_add,
                  color: Colors.teal.shade600,),
                title: Text("Pick a friend"),
                hoverColor: Colors.teal,
                onTap: () {
                },
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.privacy_tip,
                  color: Colors.teal.shade600,),
                title: Text("Privacy Policy"),
                hoverColor: Colors.teal,
                onTap: () {
                },
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0.2,vertical: 1.0),
                leading: Icon(Icons.logout_outlined,
                  color: Colors.teal.shade600,),
                title: Text("Logout"),
                hoverColor: Colors.redAccent,
                onTap: () {
                  Navigator.pushNamed(context, route.loginPage);
                },
              ),
            ],
          ),
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
        child: Container(
          height: 40,
          //width: 20,
          decoration: BoxDecoration(
              border: Border.all(

              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Container(
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Trending()));
                  },
                  icon: const Icon(
                    Icons.trending_up,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage()));
                  },
                  icon: const Icon(
                    Icons.groups_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupsPage()));
                  },
                  icon: const Icon(
                    Icons.group_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Trending()));
                  },
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        activeBackgroundColor: Colors.teal.shade900,
        activeForegroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild( //speed dial child
            child: Icon(Icons.groups),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewGroups()));

            },
            backgroundColor: Colors.teal.shade600,
            foregroundColor: Colors.white,
            label: 'New Group',
            labelStyle: TextStyle(fontSize: 18.0),
          ),
          SpeedDialChild(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGroups()));
            },
            child: Icon(Icons.brush),
            backgroundColor: Colors.teal.shade400,
            foregroundColor: Colors.white,
            label: 'My Groups',
            labelStyle: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
}
}