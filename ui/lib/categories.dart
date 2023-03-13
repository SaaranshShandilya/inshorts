import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({Key?key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Categories> {

  @override
  Widget build(BuildContext context){
    return(
      Scaffold(
        appBar:AppBar(
          title:SvgPicture.asset('assets/logo.svg',
          height:60,
          width:60,
        ),
        centerTitle: true,
        backgroundColor:Color.fromARGB(233, 192, 183, 240) ,
        toolbarHeight: 90,
        shadowColor: Colors.black,
        ),
        body:Center(
          child: GridView.count(
            crossAxisCount: 2,
            children:List.generate(8, (index) {
              return Center(
                child:Text('Category $index')
              );
            })
          ),
        )
      )
    );
  }
}