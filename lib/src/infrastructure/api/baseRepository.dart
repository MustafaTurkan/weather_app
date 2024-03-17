import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/infrastructure/infrastructure.dart';

class BaseRepository {
  late http.Client _httpClient;

  BaseRepository() {
    _httpClient = http.Client();
  }

  Future<Map<String, dynamic>?> get(String tag, {double? lat, double? lon, String? cityName}) async {
    try {
      String url = _buildUrl(tag, cityName, lat, lon);
      http.Response response = await _httpClient.get(Uri.parse(url));

      if (response.statusCode == Constants.statusOk) {
        Map<String, dynamic>? jsonBody = json.decode(response.body);
        return jsonBody;
      } else {
        throw ApiException(response.body);
      }
    } on SocketException catch (_) {
      throw ApiSocketException();
    } catch (_) {
      throw GlobalException();
    }
  }

  String _buildUrl(String tag, String? cityName, double? lat, double? lon) {
    String url = 'https://api.openweathermap.org/data/2.5/' + '$tag?';

    if (cityName != null) {
      url += 'q=$cityName&';
    } else {
      url += 'lat=$lat&lon=$lon&';
    }

    url += 'appid=${Constants.apiKey}&';
    url += 'lang=tr';
    return url;
  }
}
