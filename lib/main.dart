import 'package:flutter/material.dart';

import 'routes.dart';
import 'secreens/home.dart';

void main(){
  runApp(myApp());
}


class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      title: 'animation App',
      initialRoute: Routes.home,
    );
  }
}
