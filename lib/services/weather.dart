import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey='3c584eac8195f634a14b05a4e6071f32';
const WeathermapURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future <dynamic> getCityWeather(String city)async{
    var url='$WeathermapURL?q= $city&appid=$apiKey&units=imperial';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Location location=Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper=NetworkHelper('$WeathermapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial');

    var weatherData=await networkHelper.getData();
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
      return '☃️';
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
    if (temp > 90) {
      return 'It\'s 🍦 time';
    } else if (temp > 70) {
      return 'Time for shorts and 👕';
    } else if (temp < 60) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
