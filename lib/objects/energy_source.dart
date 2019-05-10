import 'package:flutter/material.dart';

class EnergySource extends StatefulWidget{
  final Offset initOffset;

  EnergySource({
    Key key,
    this.initOffset,
  })
  : super(key:key);

 @override
 EnergySourceState createState()=> EnergySourceState();

 GlobalKey<EnergySourceState> get gKey => key;
}

class EnergySourceState extends State<EnergySource>{
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initOffset;
  }
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Stack(
        children:<Widget>[
          Container(
            height: 30.0,
            width: 30.0,
            color: Colors.green,
          ),
        ]
      )
    );
  }

}