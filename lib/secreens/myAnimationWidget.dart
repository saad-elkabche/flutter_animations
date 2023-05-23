import 'package:flutter/material.dart';

class ItemData{
  final Icon icon;
  ItemData({required this.icon});
}

class _ItemWidget extends StatelessWidget {
  ItemData itemData;
  ValueChanged<int>? ontap;
  int index;
   _ItemWidget({Key? key,required this.index,required this.itemData,this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>ontap!.call(index),
      child: itemData.icon,
    );
  }
}

class myWidget extends StatefulWidget {
  final List<ItemData> items;


  myWidget({Key? key,required this.items}) : super(key: key);

  @override
  State<myWidget> createState() => _myWidgetState();
}

class _myWidgetState extends State<myWidget> {
 double y=0;
 double x=0;
  Size? size;

  int _selectedItem=0;
  late List<GlobalKey> listKeys;

  double _height=110;


  @override
  void initState() {
    listKeys=List.filled(widget.items.length ,GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius:const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
      ),
      child:Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
            left:getX(_selectedItem, context,50),
            bottom:(_height/3)-10,
            child: Container(
              height: 50,
              width: 50,
              decoration:const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle
              ),
            ),
          ),
          for(int i=0;i<widget.items.length;i++)
            Positioned(
                left: getX(i, context,30),
                bottom: _height/3,
                child: _ItemWidget(index: i,itemData: widget.items[i],ontap: _onClicked,)
            )

        ],
      )
    );
  }

  void updateXY(){
    var renderBox=listKeys[_selectedItem].currentContext?.findRenderObject() as RenderBox;
    size=renderBox.size;
    Offset offset=renderBox.localToGlobal(Offset.zero);
    x=offset.dx;
    y=offset.dy;
    print("x  :$x  y:$y");
  }
  
  Widget getItem(int index){
    var key =GlobalKey();
    listKeys[index]=key;
    _ItemWidget item= _ItemWidget(key:key,index: index, itemData: widget.items[index],ontap:_onClicked);


      return (index==_selectedItem && x==0 && y==0)? Container(
        height: 50,
        width: 50,
        decoration:const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle
        ),
        child: item,
      ):item;
    }

  
  
  void _onClicked(int index){

    setState(() {
      _selectedItem=index;
    });
  }

  double getX(int index,BuildContext context,double widgetWidth){
    double width=MediaQuery.of(context).size.width;
    double spaceOfEachItem=width/widget.items.length;
    double x=(spaceOfEachItem*(index+1))-((spaceOfEachItem/2)+(widgetWidth/2));
    return x;
  }
  
}



