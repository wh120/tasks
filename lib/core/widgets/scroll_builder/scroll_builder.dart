import 'package:flutter/material.dart';

class ScrollBuilder extends StatelessWidget {
  final Axis scrollDirection ;
  final int itemCount;
  final  IndexedWidgetBuilder itemBuilder;
  final ScrollPhysics? physics;
  final bool withScroll;
  const ScrollBuilder({Key? key,  this.scrollDirection= Axis.vertical, required this.itemCount, required this.itemBuilder, this.physics,   this.withScroll=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(withScroll) {
      return SingleChildScrollView(
      physics: physics,
      scrollDirection: scrollDirection,
      child: buildChild(context)
      ,
    );
    } else {
      return buildChild(context);
    }
  }
  Widget buildChild(BuildContext context){
    List<Widget> children =List.generate(itemCount, (index) => itemBuilder(context, index) ) ;

    return scrollDirection==Axis.vertical?
    Column(
      children: children,
    ):
    Row(
      children: children,
    );
  }
}
