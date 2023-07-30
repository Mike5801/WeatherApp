import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class NetworkHelper {
  NetworkHelper({required this.url});

  final Uri url;

  Future getData() async {
    try {
      http.Response response = await http.get(url);

      String decodedData = jsonDecode(response.body);

      return decodedData;
    } catch (e) {
      print(e);
    }
  }
}
