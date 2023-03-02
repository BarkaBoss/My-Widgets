import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  double width;
  double height;

  WeatherCard({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.95,
      height: height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xfff3f3f3),
          boxShadow: [
            BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset.fromDirection(5, 5))
          ]),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: width * 0.5,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffDDDDDD),
                          offset: Offset(3, 3),
                          blurRadius: 3,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: const[
                              Icon(Icons.commute, color: Colors.grey,),
                              SizedBox(width: 5,),
                              Text("Commute", style: TextStyle(color: Colors.grey,),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: const[
                              Text("Ross", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              Icon(Icons.circle, size: 5, color: Colors.grey,),
                              Text("Updated 1 min ago", style: TextStyle(color: Colors.grey, fontSize: 10),)
                            ],
                          ),
                          Row(
                              children: const [
                                Text("20 min", style: TextStyle(color: Colors.green, fontSize: 14),),
                                Text("to work", style: TextStyle(color: Colors.grey, fontSize: 14),)
                              ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.45,
                      height: height * 0.1,
                      decoration: const BoxDecoration(
                          image: DecorationImage(fit:BoxFit.fitWidth, image: NetworkImage("https://i0.wp.com/www.cssscript.com/wp-content/uploads/2018/03/Simple-Location-Picker.png"))),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
