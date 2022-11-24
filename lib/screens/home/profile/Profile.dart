import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rezzid/screens/home/profile/profileSection/EditProfileIn.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  //final String text;
  String? finalName;
  List<String> name = [];
  @override
  void initState(){
    super.initState();
    readData();
  }
  bool isLoading = true;

  //var totalLength=name.lastIndexOf(element)
  Future<void> readData()async{
    var url="https://community-eea17-default-rtdb.firebaseio.com/"+"register.json";
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as  Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        name.add(blogData["Name"]);
        finalName=name.last;

      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox.fromSize(
                  size: Size(70, 70),
                  child: ClipOval(
                    child: Material(
                      color: Colors.teal,
                      child: InkWell(
                        splashColor: Colors.black87,
                        onTap: () {
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                          child: Text(

                            '$finalName',
                            style: TextStyle(fontSize: 20),
                          ),

                ),
                const Text("Followers 0   Following 0"),
                const SizedBox(
                  height: 20,
                ),
                Text("Great code comes from stupid problems!",
                    style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          Colors.pinkAccent,
                          Colors.deepPurple.shade200,
                          Colors.tealAccent
                        ],
                      ).createShader(
                          Rect.fromLTWH(10.0, 0.0, 200.0, 100.0))
                )
                ),
                Center(
                  child: SizedBox(
                    width: 80.0,
                    height: 50,
                    child: ElevatedButton(
                        child: Text("Edit"),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                        }
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    )
    );
  }
}
