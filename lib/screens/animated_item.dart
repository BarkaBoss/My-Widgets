import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimateItem extends StatefulWidget {
  const AnimateItem({Key? key}) : super(key: key);

  @override
  State<AnimateItem> createState() => _AnimateItemState();
}

class _AnimateItemState extends State<AnimateItem>
    with SingleTickerProviderStateMixin {
  double? _deviceHeight, _deviceWidth;
  AnimationController? _shoeAnimationController;

  @override
  void initState() {
    super.initState();
    _shoeAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _shoeAnimationController!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: _deviceWidth! * 0.60,
              height: _deviceHeight! * 0.30,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.cyan],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(20)),
              child: Transform.rotate(
                angle: -math.pi / 2,
                child: const Padding(
                    padding: EdgeInsets.only(left: 5, top: 15),
                    child: Text(
                      "Nike",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            AnimatedBuilder(
                animation: _shoeAnimationController!.view,
                builder: (buildContext, child) {
                  return Transform.translate(
                    offset: Offset(_shoeAnimationController!.value,
                        _shoeAnimationController!.value * -100),
                    child: child,
                  );
                },
                child: Image(
                    width: _deviceWidth! * 0.7,
                    image: AssetImage("assets/images/shoe.png")))
          ],
        ),
      ),
    );
  }
}
