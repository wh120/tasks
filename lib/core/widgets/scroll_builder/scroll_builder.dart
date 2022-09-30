import 'package:flutter/material.dart';

class ScrollBuilder extends StatelessWidget {
  final Axis scrollDirection ;
  final int itemCount;
  final  IndexedWidgetBuilder itemBuilder;
  const ScrollBuilder({Key? key,  this.scrollDirection= Axis.vertical, required this.itemCount, required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children =List.generate(itemCount, (index) => itemBuilder(context, index) ) ;
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: scrollDirection==Axis.vertical?
      Column(
        children: children,
      ):
       Row(
         children: children,
       )   
      ,
    );
  }
}
