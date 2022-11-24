import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rezzid/screens/routingPage.dart';

import '../Profile.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  final _formGlobalKey = GlobalKey <FormState>();
  String? _mypasswords;
  String? _password,_email,_phoneNo,_name;
  // void writeData()async{
  //   _formGlobalKey.currentState!.save();
  //   var url="https://community-eea17-default-rtdb.firebaseio.com/"+"register.json";
  //   try{
  //     final response=await http.post(
  //         Uri.parse(url),
  //         body: json.encode({
  //           "password":_password,
  //           "Phoneno":_phoneNo,
  //           "Email":_email,
  //           "Name":_name
  //         })
  //     );
  //   }catch(error){
  //     throw error;
  //   }
  //
  // }
  @override
  var size,height,width;
  bool _isHidden = true;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    //String? _passwords;
    return Form(
        key: _formGlobalKey,
        child: Scaffold(
            body: Container(
              margin: EdgeInsets.all(0),
              width:double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.2,
                        0.5,
                        0.8,
                        0.7
                      ],
                      colors: [
                        Colors.teal.shade600,
                        Colors.teal.shade200,
                        Colors.teal.shade300,
                        Colors.teal.shade500
                      ])
              ),
              padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(padding: EdgeInsets.all(0),
                        child: Text("Edit Profile",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = const LinearGradient(
                                  colors: <Color>[
                                    Colors.pinkAccent,
                                    Colors.black,
                                    Colors.red
                                  ],
                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox.fromSize(
                        //size: Size(70, 70),
                        child: Badge(
                          badgeContent: const Icon(Icons.edit,
                            color: Colors.black87,
                          ),
                          badgeColor: Colors.tealAccent,
                          child: Icon(Icons.person, size: 30),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: " Name",
                                label: Text(" Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                icon: Icon(Icons.perm_contact_cal_rounded,
                                  color: Colors.black,)
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter name';
                              }
                              if(!RegExp(r"^[A-Za-z]+$").hasMatch(value)){
                                return 'Please input alphabet characters only';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _name=value;
                            },
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email",
                                label: Text("Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                icon: Icon(Icons.email,
                                  color: Colors.black,)
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter email';
                              }
                              if(!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)){
                                return 'Email is not valid';
                              }
                            },
                            onSaved: (value){
                              _email=value;
                            },
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Phone Number",
                                label: Text("Phone No",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                icon: Icon(Icons.phone,
                                  color: Colors.black,)
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please enter phone number';
                              }
                              if(!RegExp(r"^\+?[0-9-]+").hasMatch(value)){
                                return 'phone no is not valid';
                              }
                            },
                            onSaved: (value){
                              _phoneNo=value;
                            },
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                            child: TextFormField(
                              maxLines: 10,
                              minLines: 5,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: " Bio here",
                                  label: Text(" Bio",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                  icon: Icon(Icons.perm_contact_cal_rounded,
                                    color: Colors.black,)
                              ),
                              validator: (value){

                              },
                              onSaved: (value){
                                _name=value;
                              },
                            ),

                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300.0,
                            height: 50,
                            child: ElevatedButton(
                                child: const Text("Conform Changes"),
                                onPressed: (){
                                  if(_formGlobalKey.currentState!.validate()){
                                    //writeData();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(text: '',)));
                                  }

                                }
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}