import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);
  @override
  State<Trending> createState() => _TrendingState();
}
class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vogue")),
      body: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return GFListTile(
              color: Colors.teal.shade100,
              margin: const EdgeInsets.only(left: 25,right: 25,bottom: 20,top: 20),
              avatar:const GFAvatar(
                shape: GFAvatarShape.square,
                backgroundImage: AssetImage('assets/images/index2.jpeg'),
              ),
              titleText:'Name',
              subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
              icon: Icon(Icons.favorite,color: Colors.pink.shade800),

            );
          }),
    );

  }
}
