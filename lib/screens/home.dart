import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double? _deviceHeight;
  double? _deviceWidth;
  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: WeatherCard(width: _deviceWidth!, height: _deviceHeight!,),
      ),
    );
  }
}
