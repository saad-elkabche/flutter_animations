import 'package:flutter/material.dart';
import 'package:flutter_animation/secreens/Animations.dart';
import 'package:flutter_animation/secreens/opacity.dart';

import '../routes.dart';
import 'secondPage.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Animations"),
      ),
      body: Align(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          child: Column(
            children: [
              getButton(context, "Opacity",()=>_NavToOpacityAnim(Routes.opacity)),
              getButton(context, "Transition",_openWithTransition),
              getButton(context, "Scale",_openWithScale),
              getButton(context,"Rotation",_openWithRotation),
              getButton(context, "Rotation & Scale",_openWithRotationScale),
              getButton(context, "Rotation & Scale & Slide",_openWithRotationScaleTrasition),
            ],
          ),
        ),
      ),
    );
  }

  void _NavToOpacityAnim(String distination) {
    Navigator.of(context).pushNamed(distination);
  }
  void _openWithTransition() {
    Navigator.of(context).push(TransitionAnimation(Page: const SecondPage()));
  }
  void _openWithScale() {
    Navigator.of(context).push(ScaleAnimation(Page: const SecondPage()));
  }
  void _openWithRotation() {
   Navigator.of(context).push(RoatationAnimation(Page: const SecondPage()));
  }
  void _openWithRotationScale() {
    Navigator.of(context).push(RotationAndScale(page: const SecondPage()));
  }
  void _openWithRotationScaleTrasition() {
    Navigator.of(context).push(
        RotationScaleTransitionAnimation(page: const SecondPage())
    );
  }


  Widget getButton(BuildContext context,String text,VoidCallback onClick){
    return ElevatedButton(onPressed: onClick,
      style: ElevatedButton.styleFrom(fixedSize: Size(MediaQuery.of(context).size.width,25 )),
        child: Text(text,textAlign:TextAlign.center),
    );
  }










}
