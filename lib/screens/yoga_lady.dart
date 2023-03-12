import 'package:flutter/material.dart';

class LoopLady extends StatefulWidget {
  const LoopLady({Key? key}) : super(key: key);

  @override
  State<LoopLady> createState() => _LoopLadyState();
}

class _LoopLadyState extends State<LoopLady>
    with TickerProviderStateMixin {
  AnimationController? _ladyAnimation;
  AnimationController? _ringsAnimation;

  @override
  void initState() {
    super.initState();
    _ladyAnimation = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _ladyAnimation!.repeat(reverse: true);

    _ringsAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _ringsAnimation!.repeat(reverse: true);
  }

  double _radius = 300;

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
                  builder: (context, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value*1, scaleY: _ringsAnimation!.value*1, child: child,);
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
                  builder: (context, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value*0.8, scaleY: _ringsAnimation!.value*0.8, child: child,);
                  },
                  child: Container(
                    width: _radius - 80,
                    height: _radius - 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.cyan.withOpacity(0.5)),
                  ),
                ),
                AnimatedBuilder(
                  animation: _ringsAnimation!.view,
                  builder: (context, child){
                    return Transform.scale(scaleX: _ringsAnimation!.value*0.7, scaleY: _ringsAnimation!.value*0.7, child: child,);
                  },
                  child: Container(
                    height: _radius - 150,
                    width: _radius - 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.cyan.withOpacity(0.75),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: AnimatedBuilder(
                  animation: _ladyAnimation!.view,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          _ladyAnimation!.value, _ladyAnimation!.value * 50),
                      child: child,
                    );
                  },
                  child: Image( width: 400, image: AssetImage("assets/images/yoga_lady.png")),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
