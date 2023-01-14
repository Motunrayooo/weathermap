import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
//getting access to the weatherdata,by creating new weathermodel below
  //the output of the varaible would be stored in a variable
var weatherData = await WeatherModel().getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData);
  }));
  }





  @override
  Widget build(BuildContext context) {

     return Scaffold(
        body: SpinKitFadingFour(
          color: Colors.white,
          size: 100.0,
        ),
     );
   }
  }

