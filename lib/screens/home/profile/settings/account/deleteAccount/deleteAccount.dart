import 'package:flutter/material.dart';
import '../../../../../login/loginpage.dart';
class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final _formGlobalKey = GlobalKey <FormState>();
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "REZZID",
              style: TextStyle(color: Colors.white),
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
        body: Center(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Delete your account ?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text("If you delete your account, all your messages and contacts will be deleted beyond retrival. All groups that you created will be orphaned and left  with out a creator."),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formGlobalKey,
                  child: TextFormField(
                    onChanged: (String text)=>_password=text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter password to delete account",
                        label: const Text("Password"),
                        icon: Icon(Icons.lock,
                          color: Colors.teal.shade400,)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 300.0,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text("Delete My Account"),
                    onPressed: ()  async {
                      if(_formGlobalKey.currentState!.validate()){
                        final ConfirmAction action = (await _asyncConfirmDialog(context)) as ConfirmAction;
                      }

                    },
                  ),
                ),
              ),

            ],
          ),
        )
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
        title: const Text('Delete your account?'),
        content: const Text(
            'This will delete your account permanently .'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenPage()));
            },
          )
        ],
      );
    },
  );
}
