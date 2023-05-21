import 'package:flutter/material.dart';



class TransitionAnimation extends PageRouteBuilder{
  final Page;

  TransitionAnimation({this.Page}):super(
      pageBuilder: (context,animation,otherAnimation)=>Page,
      transitionsBuilder: (context,animation,otherAnimation,child){
        var begin=const Offset(1, -1);
        var end=const Offset(0, 0.0);
        var tween=Tween(begin: begin,end: end);
        //var offSetAnimation=animation.drive(tween);
        var curvesAnimation=CurvedAnimation(parent: animation, curve: Curves.easeInBack);

        return SlideTransition(position: tween.animate(curvesAnimation),child: child);
      },
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration:const Duration(milliseconds: 500)
  );

}


class ScaleAnimation extends PageRouteBuilder{
  Widget Page;

  ScaleAnimation({required this.Page}):super(
      pageBuilder: (context,animation,otherAnimation)=>Page,

      transitionsBuilder: (context,animation,otherAnimation,child){
        var begin=0.0;
        var end=1.0;
        var tween=Tween(begin: begin,end: end);
        //var offSetAnimation=animation.drive(tween);
        var curvesAnimation=CurvedAnimation(parent: animation, curve: Curves.easeInBack);

        return ScaleTransition(scale: tween.animate(curvesAnimation),child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration:const Duration(milliseconds: 500)
  );

}


class RoatationAnimation extends PageRouteBuilder{
  Widget Page;

  RoatationAnimation({required this.Page}):super(
      pageBuilder: (context,animation,secondaryAnimation)=>Page,
      transitionsBuilder: (context,animation,secondaryAnimation,child){
        var begin =0.0;
        var end =5.0;
        var tween=Tween(begin: begin,end: end);
        var settings=CurvedAnimation(parent: animation, curve: Curves.easeInCirc);
        return RotationTransition(turns: tween.animate(settings),child: child);
      },
      transitionDuration: const Duration(seconds: 2),
      reverseTransitionDuration: const Duration(seconds: 2)
  );

}



class RotationAndScale extends PageRouteBuilder{
  Widget page;

  RotationAndScale({required this.page}):super(
    pageBuilder: (context,animation,secondaryAnimation)=>page,
    transitionsBuilder: (context,animation,secondaryAnimation,child){
      //scale
      var beginScale=0.0;
      var endScale=1.0;
      var tween=Tween(begin: beginScale,end:endScale);
      var anim=animation.drive(tween);
      var scaleTransition=ScaleTransition(scale: anim,child: child);
      //rotation
      var beginRoation=0.0;
      var endRotation=5.0;
      var tweenrotation=Tween(begin: beginRoation,end: endRotation);
      var animRotation=animation.drive(tweenrotation);
      var rotationAndScaleTransition=RotationTransition(turns: animRotation,child:scaleTransition);
        return rotationAndScaleTransition;
      },
    transitionDuration: const Duration(seconds:2),
    reverseTransitionDuration: const Duration(seconds: 2)
  );
}

class RotationScaleTransitionAnimation extends PageRouteBuilder{
  Widget page;
  RotationScaleTransitionAnimation({required this.page}):super(
    pageBuilder: (context,animation,secondaryAnimation)=>page,
    transitionsBuilder: (context,animation,secondaryAnimation,child){
      //scale
      var beginScale=0.0;
      var endScale=1.0;
      var tween=Tween(begin: beginScale,end:endScale);
      var anim=animation.drive(tween);
      var scaleTransition=ScaleTransition(scale: anim,child: child);
      //rotation
      var beginRoation=0.0;
      var endRotation=5.0;
      var tweenrotation=Tween(begin: beginRoation,end: endRotation);
      var animRotation=animation.drive(tweenrotation);
      var rotationAndScaleTransition=RotationTransition(turns: animRotation,child:scaleTransition);
      //transition
      var beginTrans=const Offset(1, -1);
      var endTrans=Offset.zero;
      var tweenTrans=Tween(begin: beginTrans,end: endTrans);
      var animTrans=animation.drive(tweenTrans);
      var rotationScaleTransition =SlideTransition(position: animTrans,child:rotationAndScaleTransition);
      return rotationScaleTransition;
    },
    transitionDuration:const Duration(seconds: 2),
    reverseTransitionDuration:const Duration(seconds: 2)
  );

}