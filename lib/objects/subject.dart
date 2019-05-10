import 'package:flutter/material.dart';
import 'package:natural_selection/animations/subject_motion.dart';
import 'package:natural_selection/objects/scaffolds/subject_scaffold.dart';
import 'package:natural_selection/animations/subjectEnergySourceInteraction.dart';
import 'package:natural_selection/test_objects/test_objects.dart';
import 'package:natural_selection/pages/home.dart';

class Subject extends StatefulWidget{
  final Offset initPos;
  final double initEnergy, initMass;
  final Size initSize;
  final Color initColor;
  final int initLifeTime;
  final bool moveOnSpawn;

  Subject({
    Key key, 
    this.initPos, 
    this.initEnergy, 
    this.initMass, 
    this.initSize,
    this.initColor,
    this.initLifeTime = 360,
    this.moveOnSpawn = false,
    }) 
    : super(key: key);

  @override
  SubjectState createState()=> SubjectState();

  GlobalKey<SubjectState> get gKey => key;
}

class SubjectState extends State<Subject> with TickerProviderStateMixin{
  Offset position = Offset(0.0, 0.0);
  double energy, mass, height, width;
  Size size;
  Color color;
  int lifeTime;

  Animation<int> animationLifetime;
  Animation<Offset> animationMotion;
  Animation<double> animationGrow;

  AnimationController controllerMotion;
  AnimationController controllerGrow;
  AnimationController controllerLifetime;
  
  Animation curve;
  Animation growCurve;
   
  @override
  void initState(){  
    position = widget.initPos;
    energy = widget.initEnergy;
    mass = widget.initMass;
    size = widget.initSize;
    height = size.height;
    width = size.width;
    color = widget.initColor;
    lifeTime = widget.initLifeTime;
    setState(() {
      if(widget.moveOnSpawn == true){
      motion();    
    }
    });  
    super.initState();
  }
  //
  //Scaffold
  //
  @override
  Widget build(BuildContext context){
    return subjectScaffold(position, energy, height, width, color);
  }
  //
  //
  //
  lifetime(){
    controllerLifetime = AnimationController(
      vsync: this,
      duration: Duration(seconds: lifeTime)
    );
    animationLifetime = Tween<int>(begin: 0, end: lifeTime).animate(controllerLifetime)
    ..addListener((){

    });

  }
  //
  //motion() manages the motion of the Subject.
  //
  motion(){
    RandomMotionInLine _rand = RandomMotionInLine(offStart: position, size: size);
    SubjectEnergySourceInteraction _sei = SubjectEnergySourceInteraction(position, eS[0].gKey.currentState.position);
    
    Offset endPosition = _rand.motion(dB);
    const int tms = 1000;

    double v = (position - endPosition).distance / tms;
    double energyKin = mass * v * v;

    controllerMotion = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:tms),
    );
    curve = CurvedAnimation(parent: controllerMotion, curve: Curves.easeInOutCirc);
    animationMotion = Tween<Offset>(begin: position, end: endPosition).animate(curve)
      ..addListener((){
        setState(() {
          position = animationMotion.value;
        });
      })
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          if(energy > 300){
            _addNewSubject();            
            grow(-200);
          }
            if(energy <= 0){
              controllerMotion.stop();
              controllerMotion.dispose();
              return true;
            }
          if(lifeTime <= 1){
              controllerMotion.stop();
              controllerMotion.dispose();
              return true;
            
          }
          if(_sei.distSubjectEnergySource()){
            grow(100);
          }
          setState(() {
           energy = energy - energyKin;
           height = energy/2;
           width = energy/2;
           lifeTime--;
          });
          //
          //Recursion
          //
          controllerMotion.dispose();
          motion();
          //
          //
          //
        }               
      });
    controllerMotion.forward();
  }
  //
  //grow() manages the Size of the Subject.
  //
  grow(int changeVal){
    double newEnergy = energy + changeVal;
    controllerGrow = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:5000),
    );
    growCurve = CurvedAnimation(parent: controllerGrow, curve: Curves.bounceOut);
    animationGrow = Tween<double>(begin: energy, end: newEnergy).animate(growCurve)
      ..addListener((){
        setState(() {
          energy = animationGrow.value;
          height = energy/2;
          width = energy/2;
        });
      });               
    controllerGrow.forward();
  }
  //
  //For a given energy threshold there will be a new Subjet added.
  //
  _addNewSubject(){
    dB.add(
      Subject(
        key: GlobalKey<SubjectState>(), 
        initPos: Offset(0.0, 0.0), 
        initEnergy: 100.0, 
        initMass: 50.0, 
        initSize: Size(50.0, 50.0),
        initColor: color,
        moveOnSpawn: true,
      )
    ,);
  }
}