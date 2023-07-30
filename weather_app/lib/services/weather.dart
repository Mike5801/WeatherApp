import 'package:weather_app/services/networking.dart';

import '../services/location.dart';
import '../utilities/constants.dart';

const String baseURL = 'api.openweathermap.org';
const String baseUrlParams = '/data/2.5/weather';

class WeatherModel {
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

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Uri url = Uri.https(baseURL, baseUrlParams, {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'APPID': kApiKey,
      'units': 'metric'
    });

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
