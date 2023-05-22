import 'dart:math';

import 'package:flutter/material.dart';

class AnimateContainer extends StatefulWidget {
  const AnimateContainer({Key? key}) : super(key: key);

  @override
  State<AnimateContainer> createState() => _AnimateContainerState();
}

class _AnimateContainerState extends State<AnimateContainer> {
  late double _scale;
  late double _rotate;
  late double _x;
  late double _y;
  double _origin_x=0;
  double _origin_y=0;


  @override
  void initState() {
    super.initState();
    _scale=1;
    _rotate=0;
    _y=0;
    _x=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Animate Container"),
      ),
      body: Column(
        children: [
          _containerSection(),
           _toolsSection()
        ],
      ),
    );
  }

   Widget _containerSection() {
    return Flexible(
        flex: 2,
        child: Center(
          child: Transform.translate(//translate
            offset: Offset(_x,_y),
            child: Transform.rotate( //Rotation
              origin: Offset(_origin_x,_origin_y),
              angle: _rotate,
              child: Transform.scale(// Scale
                origin: Offset(_origin_x,_origin_y),
                scale: _scale,
                child: Container(
                  height: 100,
                  width: 120,
                  decoration:const BoxDecoration(
                    border: Border(right: BorderSide(width: 2,color: Colors.black)),
                    color: Colors.teal,
                  ),

                ),
              ),
            ),
          ),
        )
    );
   }

  Widget _toolsSection() {
    return Flexible(
        flex: 2,
        child: Container(
          color: Colors.transparent,
          child: Center(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 _tool(_onScaleChancheg, 'Scale',10, 0,_scale),
                 _tool(_onRotationChancheg, 'Rotation',2*pi, 0,_rotate),
                 _tool(_onXChancheg, 'X',200, -200,_x),
                 _tool(_onYChancheg, 'Y',600, -600,_y),
                 _tool(_onOriginXChanged, "Origin X", 60, -60, _origin_x),
                 _tool(_onOriginYchanged, "Origin Y", 50, -50, _origin_y),
               ],
             ),
           ),
          ),
        )
    );
  }
  void _onScaleChancheg(double value){
    setState(() {
      _scale=value;
    });
  }
  void _onRotationChancheg(double value){
    setState(() {
      _rotate=value;
    });
  }
  void _onXChancheg(double value){
    setState(() {
      _x=value;
    });
  }
  void _onYChancheg(double value){
    setState(() {
      _y=value;
    });
  }
  void _onOriginXChanged(double value){
   setState(() {
     _origin_x=value;
   });
  }
  void _onOriginYchanged(double value){
    setState(() {
      _origin_y=value;
    });
  }







  Widget _tool(ValueChanged<double> onchanged,String Toolname,double max,double min,double value){
    return Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Toolname,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.teal),),
          Slider(
            value: value,
            onChanged: onchanged,
            min: min,
            max: max,
          )
        ],
      ),
    );
  }
  
  
  
}
