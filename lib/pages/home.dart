import 'package:flutter/material.dart';
import 'package:natural_selection/test_objects/test_objects.dart';
import 'package:natural_selection/objects/scaffolds/home_scaffold.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  GlobalKey<_MyHomePageState> get gKey => key;
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  
  Animation<int> ani;
  AnimationController cont;

  @override
  Widget build(BuildContext context) {  
    return home(startMotion);
  }
  startMotion(){
    for(int i = 0; i < dB.length; i++){                            
        dB[i].gKey.currentState.motion();
    }
  }
}