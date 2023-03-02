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
          color: const Color(0xffD4EDED),
          boxShadow: [
            BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset.fromDirection(3, 3))
          ]),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              _weatherCard(),
              _locationCard()
            ],
          )),
    );
  }

  Widget _weatherCard(){
    return Container(
      width: width * 0.5,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const[
                  Icon(size:15, Icons.watch_later_outlined, color: Colors.grey,),
                  Text("  8:00 AM Tue, Oct 16", style: TextStyle(fontSize: 11, color: Colors.grey),)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  Text("65\u00B0", style: TextStyle(fontSize: 50),),
                  SizedBox(width: 5,),
                  Text("Clear", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tue"),
                  SizedBox(height: 3,),
                  Icon(Icons.sunny, color: Colors.amber,),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text("35\u00B0", style: TextStyle(fontSize: 11,)),
                      SizedBox(width: 3,),
                      Text("38\u00B0", style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Wed"),
                  SizedBox(height: 3,),
                  Icon(Icons.cloud, color: Colors.white,),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30\u00B0", style: TextStyle(fontSize: 11,)),
                      SizedBox(width: 3,),
                      Text("35\u00B0", style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Thu"),
                  SizedBox(height: 3,),
                  Icon(Icons.cloudy_snowing, color: Colors.white,),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30\u00B0", style: TextStyle(fontSize: 11,)),
                      SizedBox(width: 3,),
                      Text("35\u00B0", style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _locationCard(){
    return Container(
      padding: const EdgeInsets.all(15),
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
                    Text("20 min ", style: TextStyle(color: Colors.green, fontSize: 14),),
                    Text("to work", style: TextStyle(color: Colors.black, fontSize: 14),)
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
    );
  }
}
