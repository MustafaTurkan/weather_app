class Temperature {
  final double? _kelvin;

  Temperature(this._kelvin);
  double? get kelvin => _kelvin;
  double? get celsius => _kelvin != null ? _kelvin - 273.15 : null;
  double? get fahrenheit => _kelvin != null ? _kelvin * (9 / 5) - 459.67 : null;

  @override
  String toString() => celsius != null ? '${celsius!.toStringAsFixed(1)} Celsius' : "No temperature";
}

class Weather {
  String? _country, _areaName, _weatherMain, _weatherDescription, _weatherIcon;
  Temperature? _temperature, _tempMin, _tempMax, _tempFeelsLike;
  Map<String, dynamic>? _weatherData;

  DateTime? _date, _sunrise, _sunset;
  double? _latitude,
      _longitude,
      _pressure,
      _windSpeed,
      _windDegree,
      _windGust,
      _humidity,
      _cloudiness,
      _rainLastHour,
      _rainLast3Hours,
      _snowLastHour,
      _snowLast3Hours;

  int? _weatherConditionCode;

  Weather(Map<String, dynamic> jsonData) {
    Map<String, dynamic>? main = jsonData['main'];
    Map<String, dynamic>? coord = jsonData['coord'];
    Map<String, dynamic>? sys = jsonData['sys'];
    Map<String, dynamic>? wind = jsonData['wind'];
    Map<String, dynamic>? clouds = jsonData['clouds'];
    Map<String, dynamic>? rain = jsonData['rain'];
    Map<String, dynamic>? snow = jsonData['snow'];
    Map<String, dynamic>? weather = jsonData['weather'][0];

    _latitude = _unpackDouble(coord, 'lat');
    _longitude = _unpackDouble(coord, 'lon');

    _country = _unpackString(sys, 'country');
    _sunrise = _unpackDate(sys, 'sunrise');
    _sunset = _unpackDate(sys, 'sunset');

    _weatherData = jsonData;
    _weatherMain = _unpackString(weather, 'main');
    _weatherDescription = _unpackString(weather, 'description');
    _weatherIcon = _unpackString(weather, 'icon');
    _weatherConditionCode = _unpackInt(weather, 'id');

    _temperature = _unpackTemperature(main, 'temp');
    _tempMin = _unpackTemperature(main, 'temp_min');
    _tempMax = _unpackTemperature(main, 'temp_max');
    _tempFeelsLike = _unpackTemperature(main, 'feels_like');

    _humidity = _unpackDouble(main, 'humidity');
    _pressure = _unpackDouble(main, 'pressure');

    _windSpeed = _unpackDouble(wind, 'speed');
    _windDegree = _unpackDouble(wind, 'deg');
    _windGust = _unpackDouble(wind, 'gust');

    _cloudiness = _unpackDouble(clouds, 'all');

    _rainLastHour = _unpackDouble(rain, '1h');
    _rainLast3Hours = _unpackDouble(rain, '3h');

    _snowLastHour = _unpackDouble(snow, '1h');
    _snowLast3Hours = _unpackDouble(snow, '3h');

    _areaName = _unpackString(jsonData, 'name');
    _date = _unpackDate(jsonData, 'dt');
  }

  /// The original JSON data from the API
  Map<String, dynamic>? toJson() => _weatherData;

  /// The weather data formatted as a string with newlines
  @override
  String toString() {
    return '''
    Place Name: $_areaName [$_country] ($latitude, $longitude)
    Date: $_date
    Weather: $_weatherMain, $_weatherDescription
    Temp: $_temperature, Temp (min): $_tempMin, Temp (max): $_tempMax,  Temp (feels like): $_tempFeelsLike
    Sunrise: $_sunrise, Sunset: $_sunset
    Wind: speed $_windSpeed, degree: $_windDegree, gust $_windGust
    Weather Condition code: $_weatherConditionCode
    ''';
  }

  String? get weatherDescription => _weatherDescription;
  String? get weatherMain => _weatherMain;
  String? get weatherIcon => _weatherIcon;
  int? get weatherConditionCode => _weatherConditionCode;
  double? get cloudiness => _cloudiness;
  double? get windDegree => _windDegree;
  double? get windSpeed => _windSpeed;
  double? get windGust => _windGust;
  Temperature? get tempMax => _tempMax;
  Temperature? get tempMin => _tempMin;
  Temperature? get temperature => _temperature;
  Temperature? get tempFeelsLike => _tempFeelsLike;
  double? get pressure => _pressure;
  double? get humidity => _humidity;
  double? get longitude => _longitude;
  double? get latitude => _latitude;
  DateTime? get date => _date;
  DateTime? get sunset => _sunset;
  DateTime? get sunrise => _sunrise;
  String? get areaName => _areaName;
  String? get country => _country;
  double? get rainLastHour => _rainLastHour;
  double? get rainLast3Hours => _rainLast3Hours;
  double? get snowLastHour => _snowLastHour;
  double? get snowLast3Hours => _snowLast3Hours;

  int? _unpackInt(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        final val = M[k];
        if (val is String) {
          return int.parse(val);
        } else if (val is int) {
          return val;
        }
        return -1;
      }
    }
    return null;
  }

  double? _unpackDouble(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        final val = M[k];
        if (val is String) {
          return double.parse(val);
        } else if (val is num) {
          return val.toDouble();
        }
      }
    }
    return null;
  }

  String? _unpackString(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        return M[k];
      }
    }
    return null;
  }

  DateTime? _unpackDate(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        int millis = M[k] * 1000;
        return DateTime.fromMillisecondsSinceEpoch(millis);
      }
    }
    return null;
  }

  Temperature _unpackTemperature(Map<String, dynamic>? M, String k) {
    double? kelvin = _unpackDouble(M, k);
    return Temperature(kelvin);
  }
}
