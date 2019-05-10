import 'package:flutter/material.dart';

Widget subjectScaffold(Offset position, double energy, double height, double width, Color color){
  if(height <= 0){
    height = 0.0;
  }
  if(width <= 0){
    width = 0.0;
  }
  return Positioned(
      left: position.dx,
      top: position.dy,
      child: Stack(
        children:<Widget>[
          Container(
            height: height,
            width: width,
            child: CustomPaint(
              painter: SubjectPainter(height, width, color),
              willChange: true,
            )
          ),
          //Text(
            //energy.toString()
          //),
        ]
      )
    );
}

class SubjectPainter extends CustomPainter{
 Size cSize;
 double height, width;
 Color color;
 
 SubjectPainter(this.height, this.width, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
      Offset(width / 2, height / 2), 
      width / 4, paint
      );
  }

  @override
  bool shouldRepaint(SubjectPainter oldDelegate) {
    return oldDelegate.cSize != cSize;
  }
  
}