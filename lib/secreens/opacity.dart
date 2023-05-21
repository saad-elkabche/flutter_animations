import 'package:flutter/material.dart';


class OpacitySecreen extends StatefulWidget {
  const OpacitySecreen({Key? key}) : super(key: key);

  @override
  State<OpacitySecreen> createState() => _OpacitySecreenState();
}

class _OpacitySecreenState extends State<OpacitySecreen> {
  bool _start=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _start?0:1,
            duration:const  Duration(seconds: 3),
            child: Image.asset("assets/images/img.png",
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
            ),
          ),
          ElevatedButton(onPressed: _StartAnimation, child: const Text("Start Animation"))
        ],
      ),
    );
  }

  void _StartAnimation() {
    setState(() {
      _start=!_start;
    });
  }
}

