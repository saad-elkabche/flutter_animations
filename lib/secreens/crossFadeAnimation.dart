import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  const CrossFadeAnimation({Key? key}) : super(key: key);

  @override
  State<CrossFadeAnimation> createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool _isFirst=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CrossFade Animation"),),
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
        child: Center(
          child:AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild:  Container(
              height: 150,
              width: 150,
              color: Colors.orange,
            ),
            secondChild: Container(
              height: 100,
              width: 100,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pinkAccent
              ),
            ),
            crossFadeState: _isFirst?CrossFadeState.showFirst:CrossFadeState.showSecond,
          )
        )
    );
  }
  Widget get _toolSection{
    return Flexible(
        flex: 2,
        child: Center(
          child: ElevatedButton(onPressed: _changeWidget,child: Text("change widget"),),
        )
    );
  }


  void _changeWidget() {
    setState(() {
      _isFirst=!_isFirst;
    });
  }
}
