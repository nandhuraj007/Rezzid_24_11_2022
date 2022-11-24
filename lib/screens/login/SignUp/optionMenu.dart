import 'package:flutter/material.dart';
class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  List<String> items=[
    'Software','Hardware','Photography',
    'Science','Medical','Accounting',
    'Architecture and engineering','Business','Education',
    'Legal profession','Hotel Management','Fashion Designing'
  ];
  String? selectedItem="Photography";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text("Select your area of interest to join a community",style: TextStyle(fontSize: 17),),
          SizedBox(height: 10,),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 25,bottom: 25),
              child: DropdownButtonFormField(
                elevation: 30,
                icon: Icon(Icons.accessibility_new_sharp),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),

                    )
                ),
                dropdownColor: Colors.teal.shade800,
                value:selectedItem,
                items: items.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,style: TextStyle(fontSize: 20),),
                )).toList(),
                onChanged: (item) =>setState(() =>selectedItem=item as String?),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300.0,
              height: 50,
              child: ElevatedButton(
                  child: Text("Go"),
                  onPressed: () {
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
