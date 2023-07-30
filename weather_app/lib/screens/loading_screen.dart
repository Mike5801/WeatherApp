import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    
    latitude = location.latitude;
    longitude = location.longitude;

    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {'lat': latitude.toString(), 'lon': longitude.toString(), 'APPID': kApiKey});

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     
    );
  }
}
