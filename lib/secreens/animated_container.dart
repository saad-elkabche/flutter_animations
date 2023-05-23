import 'package:flutter/material.dart';

class AnimatedContainerSecreen extends StatefulWidget {
  const AnimatedContainerSecreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerSecreen> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerSecreen> {
  double _width=120;
  double _height=100;
  int _index=0;
  List<Alignment> listPositions=[
    Alignment.center,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.bottomCenter,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container"),
      ),
      body: Column(
        children: [
          _containerSection,
          _toolsSection
        ],
      ),
    );
  }

  Widget get _containerSection{
    return Flexible(
        flex: 3,
        child: Center(
          child: AnimatedContainer(
            alignment: listPositions[_index],
            duration: const Duration(seconds: 2),
            height: _height,
            width: _width,
            color: Colors.blue,
            child:ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50,maxWidth: 50),
              child: Container(width: 40,height: 40,color: Colors.amber,),
            ),
            onEnd: _startAnimation
          ),
        )
    );
  }
  Widget get _toolsSection{
    return Flexible(
      flex: 2,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[100],
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                 _button("Start Animation", _startAnimation),

                ],
              ),
            ),
          ),
        )
    );
  }

Widget _button(String action,VoidCallback onPressed){
    return  ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(fixedSize:const  Size(170,40)),
      child:Text(action),
    );
}

  void _changeContainerSize(){
    setState(() {
      _height=_height==100?200:100;
      _width=_width==120?200:120;
    });
  }
  void _changeContainerAlign(){
    setState(() {
      _index=(_index+1)%listPositions.length;
    });
  }


  void _startAnimation() {
    _changeContainerSize();
    _changeContainerAlign();
  }
}
