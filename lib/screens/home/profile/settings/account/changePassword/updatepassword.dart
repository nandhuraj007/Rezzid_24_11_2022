import 'package:flutter/material.dart';
class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);
  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}
class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  bool _isHidden = true;
  String? _mypasswords;
  final _formGlobalKey = GlobalKey <FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text(
            "REZZID",style: new TextStyle(
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
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.teal, Colors.tealAccent])),
          )
      ),
      body: Container(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Change Password",
                  style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
              Form(
                key: _formGlobalKey,
                  child:Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
                        child: TextFormField(
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0),
                            ),
                            labelText: 'Current Password',
                            icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                            border: OutlineInputBorder(),
                            hintText: "Enter the current Password",
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
                              return 'Please Enter Current Password';
                            }

                            return null;
                          },

                        ),
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
                            labelText: 'New Password',
                            icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                            border: const OutlineInputBorder(),
                            hintText: "Enter a new the password",
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
                              return 'Please enter a new password';
                            }
                            if(!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$").hasMatch(value)){
                              return 'Minimum 8 to 15 characters, with at least one digit,special character and alphabets';
                            }
                            return null;
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
                            labelText: 'Conform Password',
                            icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                            border: const OutlineInputBorder(),
                            hintText: "Reenter the password",
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
                         Padding(
                          padding: const EdgeInsets.only(left: 122,top: 10),
                          child: SizedBox(
                            width: 250.0,
                            height: 50,
                            child: ElevatedButton(
                                child: const Text("Change Password"),
                                onPressed: (){
                                  if(_formGlobalKey.currentState!.validate()){
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(title: '')));
                                  }
                                }
                            ),
                          ),
                        ),
                    ],
                  )
              ),

            ],
          ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
