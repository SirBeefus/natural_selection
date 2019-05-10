import 'package:flutter/material.dart';
import 'dart:math';
import 'package:natural_selection/objects/subject.dart';

class RandomMotionInLine{
  Offset offStart;
  Offset offEnd;
  Size size;

  double minDx = -100, maxDx = 50;
  double minDy = -100, maxDy = 50;
  
  RandomMotionInLine({
    this.offStart, 
    this.size,
    });
  //
  //Funktion to find the new Offset
  //
  Offset motion(List<Subject> subjets){
    double dx = 0.0, dy = 0.0;
    offEnd = offStart;
    const double epsilon = 5.0;
    //
    //Generate random new Offset with given Offset.
    //
    Random rDx = new Random();
    Random rDy = new Random();
    dx = offStart.dx + minDx + rDx.nextDouble()*200.0;
    dy = offStart.dy + minDy + rDy.nextDouble()*200.0;
    //
    //Check if close to Border.
    //
    if(dx <= 50.0){
       dx = offStart.dx + 50.0;
    }
    if(dx >= 250.0 - size.width){
      dx = offStart.dx - 50.0;
    }
    if(dy <= 50.0){
       dy = offStart.dy + 50.0;
    }
    if(dy >= 500.0 - size.height){
      dy = offStart.dy - 50.0;
    }
    //
    //Check if close to inlines
    //
    if(dx <= 125 || dx >= 225){
      if(dy >= 225.0 + epsilon && dy >= 225.0 - epsilon ){
        if(offStart.dy >= 225.0){
          dy = offStart.dy + 30.0;
        }
        if(offStart.dy < 225.0){
          dy = offStart.dy - 30.0;
        }
      }
    }
    
    

    offEnd = Offset(dx, dy);
    return offEnd;

  }
}