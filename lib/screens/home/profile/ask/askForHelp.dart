import 'package:flutter/material.dart';

import '../../homepage.dart';
class Ask extends StatefulWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  State<Ask> createState() => _AskState();
}

class _AskState extends State<Ask> {
  final _formGlobalKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
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
      body: Form(
        key: _formGlobalKey,
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(left: 30,top: 20,bottom: 10,right: 20),
              child: TextFormField(
                maxLines: 10,
                minLines: 8,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: " Tell us how we can help",

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Field is empty';
                  }
                  return null;
                },
              ),

            ),
            Center(
              child: SizedBox(
                width: 300.0,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38,right: 1,top: 5),
                  child: ElevatedButton(
                      child: const Text("Confirm"),
                      onPressed: () async {
                        if(_formGlobalKey.currentState!.validate()){
                          final ConfirmAction action = (await _asyncConfirmDialog(context)) as ConfirmAction;
                        }

                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
enum ConfirmAction { cancel, accept}
Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thanks for your feedback'),
        content: const Text(
            'We will respond via your registered email id',style: TextStyle(fontSize: 15),),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Back To Home'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(title: '')));
            },
          )
        ],
      );
    },
  );
}

