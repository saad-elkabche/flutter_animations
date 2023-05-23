import 'package:flutter/material.dart';
import 'package:flutter_animation/secreens/Animations.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              getButton(context, "Opacity",()=>_NavToSecreen(Routes.opacity)),
              getButton(context, "Transition",_openWithTransition),
              getButton(context, "Scale",_openWithScale),
              getButton(context,"Rotation",_openWithRotation),
              getButton(context, "Rotation & Scale",_openWithRotationScale),
              getButton(context, "Rotation & Scale & Slide",_openWithRotationScaleTrasition),
              getButton(context, "Size Animation",_openWithSizeTransition),
              getButton(context, "Fade Animation",_openWithFadeTransition),
              getButton(context, "Transform Container",()=>_NavToSecreen(Routes.containerAnim)),
              getButton(context, "matrix 4",()=>_NavToSecreen(Routes.matrix4)),
              getButton(context, "Animated Container",()=>_NavToSecreen(Routes.animatedContainer)),
              getButton(context, "Cross FadeAnimation",()=>_NavToSecreen(Routes.crossFadeAnimation)),
              getButton(context, "Text style Animation",()=>_NavToSecreen(Routes.textStyleAnimation)),
              getButton(context, "Positioned Animation",()=>_NavToSecreen(Routes.positionedAnimation)),
            ],
          ),
        ),
      ),
    );
  }

  void _NavToSecreen(String distination) {
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
  void _openWithSizeTransition() {
    Navigator.of(context).push(SizeAnimation(page: const SecondPage()));
  }
  void _openWithFadeTransition() {
    Navigator.of(context).push(FadeAnimation(page:const SecondPage()));
  }





  Widget getButton(BuildContext context,String text,VoidCallback onClick){
    return ElevatedButton(onPressed: onClick,
      style: ElevatedButton.styleFrom(fixedSize:Size( 200,25 )),
        child: Text(text,textAlign:TextAlign.center),
    );
  }














}
