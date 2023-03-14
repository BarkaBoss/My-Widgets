import 'package:flutter/material.dart';

class YogaLady extends StatefulWidget {
  const YogaLady({Key? key}) : super(key: key);

  @override
  State<YogaLady> createState() => _YogaLadyState();
}

class _YogaLadyState extends State<YogaLady> with TickerProviderStateMixin{
  AnimationController? _ladyAnimation;
  AnimationController? _ringsAnimation;
  double _radius = 300;


  @override
  void initState() {
    _ladyAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _ringsAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    
    _ladyAnimation!.repeat(reverse: true);
    _ringsAnimation!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _ringsAnimation!.view,
                  builder: (buildContext, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value * 1, scaleY: _ringsAnimation!.value * 1, child: child,);
                  },
                  child: Container(
                    width: _radius,
                    height: _radius,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.cyan.withOpacity(0.2)
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _ringsAnimation!.view,
                  builder: (buildContext, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value * 1, scaleY: _ringsAnimation!.value * 1, child: child,);
                  },
                  child: Container(
                    width: _radius - 80,
                    height: _radius - 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.cyan.withOpacity(0.5)
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _ringsAnimation!.view,
                  builder: (buildContext, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value * 1, scaleY: _ringsAnimation!.value * 1, child: child,);
                  },
                  child: Container(
                    width: _radius - 150,
                    height: _radius - 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.cyan.withOpacity(0.75)
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: AnimatedBuilder(animation: _ladyAnimation!.view, builder: (buildContext, child){
                return Transform.translate(offset: Offset(_ladyAnimation!.value, _ladyAnimation!.value *50 ), child: child,);
              },
                child: Image(image: AssetImage("assets/images/yoga_lady.png"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
