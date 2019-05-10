import 'package:flutter/material.dart';
import 'package:natural_selection/test_objects/test_objects.dart';

Widget home(Function f){
  return Scaffold(
      appBar: AppBar(
        title: Text("Natural Selection"),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Stack(children: dB,),
              Stack(children: eS,),
            ]
          ),
          Stack(
            children: <Widget>[
              CustomPaint(
                painter: Painter()
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.arrow_right),
            onTap: (){
              f();      
            },
          )
        ],
      ),
    );
}

class Painter extends CustomPainter{
  Painter();

  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;
    //
    //Border
    //
    canvas.drawLine(Offset(50.0, 50.0), Offset(50.0, 500.0), paint);
    canvas.drawLine(Offset(50.0, 50.0), Offset(300.0, 50.0), paint);
    canvas.drawLine(Offset(300.0, 50.0), Offset(300.0, 500.0), paint);
    canvas.drawLine(Offset(50.0, 500.0), Offset(300.0, 500.0), paint);
    //
    //Center lines
    //
    canvas.drawLine(Offset(50.0, 225.0), Offset(125.0, 225.0), paint);
    canvas.drawLine(Offset(300.0, 225.0), Offset(225.0, 225.0), paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}