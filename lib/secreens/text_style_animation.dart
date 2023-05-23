import 'package:flutter/material.dart';


class TextStyleAnimation extends StatefulWidget {
  const TextStyleAnimation({Key? key}) : super(key: key);

  @override
  State<TextStyleAnimation> createState() => _TextStyleAnimationState();
}

class _TextStyleAnimationState extends State<TextStyleAnimation> {
  int _index=0;
   late List<TextStyle> listStyle=[
    Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.orange),
    Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.pinkAccent),
    Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.blue),
    Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.teal),
    Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
    Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.yellow),
    Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.pinkAccent),
    Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.amberAccent),
    Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.cyanAccent),
  ];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text("text style animation"),),
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
           child: AnimatedDefaultTextStyle(
             style:listStyle[_index] ,
             duration: const Duration(seconds: 2),
             child:const Text("Saad El"),
           ),
        )
    );
  }

  Widget get _toolSection{
    return Flexible(
        flex: 2,
        child: Center(
          child: ElevatedButton(onPressed: _changeWidget,child: const Text("change Style"),),
        )
    );
  }

  void _changeWidget() {
    setState(() {
      _index=(_index+1)%listStyle.length;
    });
  }
}
