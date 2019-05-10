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
    return home(startMotion, animate);
  }

  animate(){

    int _tms = 5000;

    cont = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _tms),
    );
    ani = Tween<int>(begin: 0, end: 1).animate(cont)
      ..addListener((){
        
      })
      ..addStatusListener((status){
          if(status == AnimationStatus.completed){
            cont.reset();
            cont.forward();
            setState(() {
              
            });
          }
      });
    cont.forward();
  }
  startMotion(){
    for(int i = 0; i < dB.length; i++){                            
        dB[i].gKey.currentState.motion();
    }
  }
}