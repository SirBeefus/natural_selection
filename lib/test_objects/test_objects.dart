import 'package:flutter/material.dart';
import 'package:natural_selection/objects/subject.dart';
import 'package:natural_selection/objects/energy_source.dart';

List<Subject> dB = [

  Subject(key: GlobalKey<SubjectState>(), initPos: Offset(0.0, 0.0), initEnergy: 100.0, initMass: 50.0, initSize: Size(50.0, 50.0), initColor: Colors.red,),
  Subject(key: GlobalKey<SubjectState>(), initPos: Offset(0.0, 0.0), initEnergy: 100.0, initMass: 50.0, initSize: Size(50.0, 50.0), initColor: Colors.blue,),
  Subject(key: GlobalKey<SubjectState>(), initPos: Offset(0.0, 0.0), initEnergy: 100.0, initMass: 50.0, initSize: Size(50.0, 50.0), initColor: Colors.green,),

];

List<EnergySource> eS = [

  EnergySource(key:  GlobalKey<EnergySourceState>(), initOffset: Offset(150.0, 320.0),)

];



