import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'myAnimationWidget.dart';




class PositionedAnimation extends StatefulWidget {
  const PositionedAnimation({Key? key}) : super(key: key);

  @override
  State<PositionedAnimation> createState() => _PositionedAnimationState();
}

class _PositionedAnimationState extends State<PositionedAnimation> {
  int _index=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("positioned Animation"),),
      body: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: myWidget(
            items: [
              ItemData(icon:const Icon(Icons.account_balance,color: Colors.black,size: 30)),
              ItemData(icon: const Icon(Icons.home,color: Colors.black,size: 30)),
              ItemData(icon:const Icon(Icons.settings,color: Colors.black,size: 30)),
              ItemData(icon: const Icon(Icons.add,color: Colors.black,size: 30,),),
            ],
          ),
        ),
      ),
    );
  }
}











