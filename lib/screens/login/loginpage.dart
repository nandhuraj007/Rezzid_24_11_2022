import 'dart:convert';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rezzid/screens/routingPage.dart' as route;
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 6,
        navigateAfterSeconds: new Login(),
        backgroundColor: Colors.black,
        title: Text('Alone, we can do so little;\ntogether, we can do so much\n                              Helen Keller',
            style: TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = const LinearGradient(
                  colors: <Color>[
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.red
                  ],
                ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 100.0)
                )
            )
        ),
        image: Image.asset('assets/images/mylogo.png'),
        loadingText: const Text(" Loading",
          style: TextStyle(
              fontSize: 19,
              fontWeight:FontWeight.bold
          ),
        ),
        useLoader: true,
        photoSize: 200.0,
        loaderColor: Colors.teal,
      ),
    );
  }
}
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formGlobalKey = GlobalKey <FormState>();
  var size,height,width,temp;
  String _error='';
  String _email='';
  String _password='';
  List<String> email=[];
  List<String> password=[];
  String? finalName,finalPassword;
  Future<void>readData ()async{
    var url="https://community-eea17-default-rtdb.firebaseio.com/"+"register.json";
    try{
      final response=await http.get(Uri.parse(url));
      final extractedData=json.decode(response.body) as Map<String,dynamic>;
      if(extractedData==null){
        return;
      }
      extractedData.forEach((id, data) { 
        email.add(data["Email"]);
        password.add(data["password"]);
        finalName=email.last;
        finalPassword=password.last;
      });
    }catch(error){
      throw error;
    }
  }
  @override
  bool _isHidden = true;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Form(
      key: _formGlobalKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: const [
                      0.2, 0.5, 0.8, 0.7
                    ],
                    colors: [
                      Colors.teal.shade600,
                      Colors.teal.shade200,
                      Colors.teal.shade300,
                      Colors.teal.shade500
                    ]
                )
            ),
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child: Container(
                      width: 400,
                      height: 500,
                      child: Card(
                        elevation: 60,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        color: Colors.teal.shade300,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TypewriterAnimatedText('Login Here',
                                    speed: const Duration(milliseconds: 100),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()..shader = const LinearGradient(
                                          colors: <Color>[
                                            Colors.pinkAccent,
                                            Colors.deepPurpleAccent,
                                            Colors.red
                                          ],
                                        ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 100.0))
                                    ),),
                                ],

                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: TextFormField(
                                    onChanged: (String text)=>_email=text,
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                        border: const OutlineInputBorder(),
                                        hintText: "Enter Email",
                                        label: const Text("Email"),
                                        icon: Icon(Icons.email,
                                          color: Colors.teal.shade900,)
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please Enter Email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextFormField(
                                onChanged: (String text)=>_password=text,
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  labelText: 'Password',
                                  icon: Icon(Icons.lock,color: Colors.teal.shade900,),
                                  border: const OutlineInputBorder(),
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
                                  else{
                                    for(var i=0;i<email.length;i++){
                                      if(email[i]==_email){
                                        if(password[i]==_password){
                                          return null;
                                        }
                                        else{
                                          return 'password is not mat ';
                                        }
                                      }else{
                                        return 'email is not valid. Please register';
                                      }
                                    }
                                  }

                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: SizedBox(
                                width: 300.0,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 38,right: 1),
                                  child: ElevatedButton(
                                      child: const Text("Login"),
                                      onPressed: () {
                                        if(_formGlobalKey.currentState!.validate()){
                                          Navigator.pushNamed(context, route.homePage);
                                        }
                                      }
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(onPressed: () {
                              //Navigator.pushNamed(context, route.updatePassword);
                            },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.teal.shade900
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Need an account?',
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 20),
                                        children: <TextSpan>[
                                          TextSpan(text: ' Sign up',
                                              style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent.shade700,
                                                  fontSize: 20),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.pushNamed(
                                                      context, route.registrationPage);
                                                }
                                          )
                                        ]
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    }
    );
  }
}