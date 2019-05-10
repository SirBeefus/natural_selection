import 'package:flutter/material.dart';

class SubjectEnergySourceInteraction{
  final Offset offSubject;
  final Offset offEnergySource;
  
  SubjectEnergySourceInteraction(this.offSubject, this.offEnergySource);

  bool distSubjectEnergySource(){
    double dist = (offSubject - offEnergySource).distance;
    if(dist < 10.0 ){
      return true;
    }

    return false;
  }
}