import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/city_screen.dart';

const myApiKey = '3b3ff78577a818ba4ab2ad13d4dea62d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {

  //creating a new method for getting the weather data  based on city name passed in
  Future<dynamic> getCityWeather(String cityName) async{
  //creating an object called networking
   Networking networking = Networking(url:  'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=5&appid=$myApiKey&units=metric');
    var weatherData = await networking.getData();
    Networking networking2 = Networking(url: '$openWeatherMapURL?lat=${weatherData[0]['lat']}&lon=${weatherData[0]['lon']}&appid=$myApiKey&units=metric');
    var weatherData2 = await networking2.getData();
    return weatherData2;
  }
  //this method below is used for getting the weather of the user's current  location
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();
    Networking networking = Networking(url: '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$myApiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

