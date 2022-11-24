import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

import '../../home/homepage.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:rezzid/screens/routingPage.dart';
class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);
  @override
  State<registration> createState() => _registrationState();
}
class _registrationState extends State<registration> {
  final _formGlobalKey = GlobalKey <FormState>();
  String? _mypasswords;
  String? _password,_email,_phoneNo,_name;
  void writeData()async{
    _formGlobalKey.currentState!.save();
    var url="https://community-eea17-default-rtdb.firebaseio.com/"+"register.json";
    try{
      final response=await http.post(
        Uri.parse(url),
        body: json.encode({
          "password":_password,
          "Phoneno":_phoneNo,
          "Email":_email,
          "Name":_name
        })
      );
    }catch(error){
      throw error;
    }

  }
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
                  child: Text("Lets start your profile",
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
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.account_circle_rounded),
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
                        if(!RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$").hasMatch(value)){
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
                          hintText: "Enter phone number",
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
                        // if(!RegExp(r"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/").hasMatch(value)){
                        //   return 'phone no is not valid';
                        // }
                      },
                      onSaved: (value){
                        _phoneNo=value;
                      },
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                  child: TextFormField(
                    onChanged: (String text) => _mypasswords = text,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 2.0),
                      ),
                      labelText: 'Password',
                      icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Password';
                      }
                      if(!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$").hasMatch(value)){
                        return 'password between 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _password=value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                  child: TextFormField(
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 2.0),
                      ),
                      labelText: 'Confirm Password',
                      icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                      border: const OutlineInputBorder(),
                      hintText: "Reenter the Password",
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Reenter the Password';
                      }
                      if(value!=_mypasswords){
                        return 'Password is not matched';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:65,top: 8,bottom: 8,right: 10),
                    child: SizedBox(
                      width: 300.0,
                      height: 50,
                      child: ElevatedButton(
                          child: const Text("Register"),
                          onPressed: (){
                            if(_formGlobalKey.currentState!.validate()){
                              writeData();

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(title: '')));
                            }
                          }
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
      ),
      )
      )
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
