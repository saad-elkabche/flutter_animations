import 'dart:math';

import 'package:flutter/material.dart';


class Matrix4Secreen extends StatefulWidget {
  const Matrix4Secreen({Key? key}) : super(key: key);

  @override
  State<Matrix4Secreen> createState() => _Matrix4SecreenState();
}

class _Matrix4SecreenState extends State<Matrix4Secreen> {


  late double _rotateX;
  late double _rotateY;
  late double _rotateZ;


  @override
  void initState() {
    super.initState();
   // _scale=1;
    _rotateZ=_rotateX=_rotateY=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matrix4"),
      ),
      body: Column(
        children: [
          _containerSection,
          _toolSection
        ],
      ),
    );
  }
  Widget get _containerSection{
    return Flexible(
      flex: 3,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Transform(
              transform: Matrix4.rotationX(_rotateX)..rotateY(_rotateY)..rotateZ(_rotateZ),
              child: Container(
                height: 100,
                width: 120,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        )
    );

  }
  Widget get _toolSection{
    return Flexible(
      flex: 3,
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    _tool('rotation X', _rotateX,2*pi,0,_onXChanged ),
                    _tool('rotation Y', _rotateY,2*pi,0,_onYChanged ),
                    _tool('rotation Z', _rotateZ,2*pi,0,_onZChanged ),
                  ],
                ),
            ),
          ),
        )
    );
  }

  
  void _onXChanged(double value){
    setState(() {
      _rotateX=value;
    });
  }
  void _onYChanged(double value){
    setState(() {
      _rotateY=value;
    });
  }

  void _onZChanged(double value){
    setState(() {
      _rotateZ=value;
    });
  }


  Widget _tool(String toolName,double value,double max,double min,ValueChanged<double> valueChanged){
    return Padding(padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(toolName,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.teal),),
        Slider(value: value, onChanged: valueChanged,max: max,min: min,)
      ],
    ),
    );
  }

}

