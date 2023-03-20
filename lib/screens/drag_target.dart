import 'package:flutter/material.dart';
import 'package:my_widgets/screens/yoga_lady.dart';

class DragToTarget extends StatefulWidget {
  const DragToTarget({Key? key}) : super(key: key);

  @override
  State<DragToTarget> createState() => _DragToTargetState();
}

class _DragToTargetState extends State<DragToTarget> {
  double? _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              width: _deviceWidth,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              height: 80,
              width: _deviceWidth! - 60,
              decoration: BoxDecoration(
                  color: Colors.cyan.shade700,
                  borderRadius: BorderRadius.circular(50)),
            ),
            _dragIcon()
          ],
        )),
      ),
    );
  }

  Widget _dragIcon(){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Draggable(
            axis: Axis.horizontal,
            data: 'flag',
            feedback: _ringsStack(110, 110),
            childWhenDragging: Container(),
            onDragStarted: (){
              print("drag Started");
            },
            onDragCompleted: (){
              print("drag ended");
            },
            child: _ringsStack(100, 100),
          ),
          DragTarget<String>(
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
              ){
                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    //color: Colors.purpleAccent,
                  ),
                );
              },
            onWillAccept: (data){
                return data == 'flag';
            },
            onAccept: (data){
                print("Accepted");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>YogaLady()));
            },
            onLeave: (data){
                print("Not Completed");
            },
          ),
        ],
      ),
    );
  }

  Widget _ringsStack(double height, double width){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: height - 20,
          width: width - 20,
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(100)),
        ),
        const Icon(Icons.double_arrow, color: Colors.white,)
      ],
    );
  }
}
