import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
 WeatherModel weather= WeatherModel();
 late  num theTemp;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
//getting data from a location screen object into location screen state
//location screen statefull object is a seperate objecct from its state
  @override
  void initState() {
    super.initState();
    //every state object has a property called Widget that can be used to tap into
    // the location stateful widget
    //object ie we get access to a widget object inside every state object.
    // we can tap into our location through widget and tap into the property as well

    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData){
    print(weatherData);
    setState(() {
      //adding a conditional to prevent the app from crashing when
      // there is an issue with getting the device location needed for fetching  weather
      // data
      if(weatherData == null){
        theTemp = 0.0;
        weatherIcon = 'error';
        weatherMessage = 'unable to get weather data';
        return;
        //this return helps to end our method prematurely and prevents it from executing
       // the next line of code
      }
      else{

      double temp = weatherData['main']['temp'];
      theTemp =  temp.toInt();
      var condition = weatherData ['weather'][0]['id'];
      weatherIcon= weather.getWeatherIcon(condition);
      weatherMessage= weather.getMessage(theTemp.toInt());
      cityName =weatherData['name'];

    }});


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/nature.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      //trigger a request to get the current weather of the location by creating a new variable
                      var weatherData = await weather.getLocationWeather();
                      //getlocation method uses a future so in other to use in a weatherData
                      // we need to mark it await
                      updateUi(weatherData);

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      //when the cityname is entered the city screen, this is the output

                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      },),);
                     print(typedName);

                      //using the typename to fetch the weather data
                      // checking if the typed name is not null
                      if(typedName != null){
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: SafeArea(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$theTemp°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

