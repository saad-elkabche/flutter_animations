import 'package:flutter/material.dart';
import 'package:flutter_animation/secreens/home.dart';

import 'secreens/opacity.dart';


class Routes{
  static const String home='/';
  static const String opacity='opacity';
 /* static const String home='/';
  static const String home='/';*/
static Map<String,WidgetBuilder> routes={
  home:(context)=>const Home(),
  opacity:(context)=>OpacitySecreen()
};
}