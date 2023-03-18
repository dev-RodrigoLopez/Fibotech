// To parse this JSON data, do
//
//     final openWeather = openWeatherFromMap(jsonString);

import 'dart:convert';

class WeatherModel {
    WeatherModel({
        required this.lat,
        required this.lon,
        required this.timezone,
        required this.timezoneOffset,
        required this.current,
        required this.daily,
    });

    final double lat;
    final double lon;
    final String timezone;
    final int timezoneOffset;
    final Current current;
    final List<Daily> daily;

    WeatherModel copyWith({
      double? lat,
      double? lon,
      String? timezone,
      int? timezoneOffset,
      Current? current,
      List<Daily>? daily,
    }) => WeatherModel(
      lat : lat ?? this.lat,
      lon : lon ?? this.lon,
      timezone : timezone ?? this.timezone,
      timezoneOffset : timezoneOffset ?? this.timezoneOffset,
      current : current ?? this.current,
      daily : daily ?? this.daily,
    );

    // factory OpenWeather.fromJson(String str) => OpenWeather.fromMap(json.decode(str));
    factory WeatherModel.fromJson(dynamic str) => WeatherModel.fromMap(
      json.decode(str as String) as Map<String, dynamic>,
    );

    String toJson() => json.encode(toMap());

    // factory OpenWeather.fromMap(Map<String, dynamic> json) => OpenWeather(
    factory WeatherModel.fromMap(dynamic json) => WeatherModel(
        lat: (json['lat'] != null) ? json['lat'] as double : 0.0,
        lon: (json['lon'] != null) ? json['lon'] as double : 0.0,
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'],
        current: Current.fromMap(json['current']),
        // daily: List<Daily>.from(json['daily'].map((x) => Daily.fromMap(x))),
        daily: List<Daily>.from(
          json['daily'].map(Daily.fromMap) as Iterable,
        ),
    );

    Map<String, dynamic> toMap() => {
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'timezone_offset': timezoneOffset,
        'current': current.toMap(),
        'daily': List<dynamic>.from(daily.map((x) => x.toMap())),
    };
}

class Current {
    Current({
        required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.uvi,
        required this.clouds,
        required this.visibility,
        required this.windSpeed,
        required this.windDeg,
        required this.windGust,
        required this.weather,
        this.city = '',
        this.state = '',
        this.country = '',
    });

    final int dt;
    final int sunrise;
    final int sunset;
    final dynamic temp;
    final dynamic feelsLike;
    final int pressure;
    final int humidity;
    final dynamic dewPoint;
    final dynamic uvi;
    final int clouds;
    final int visibility;
    final dynamic windSpeed;
    final int windDeg;
    final dynamic windGust;
    final List<Weather> weather;
    final String city;
    final String state;
    final String country;


    factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    Current copyWith({
      int? dt,
      int? sunrise,
      int? sunset,
      dynamic temp,
      dynamic feelsLike,
      int? pressure,
      int? humidity,
      dynamic dewPoint,
      dynamic uvi,
      int? clouds,
      int? visibility,
      dynamic windSpeed,
      int? windDeg,
      dynamic windGust,
      List<Weather>? weather,
      String? city,
      String? state,
      String? country,
    }) => Current(
        dt: dt ?? this.dt,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        dewPoint: dewPoint ?? this.dewPoint,
        uvi: uvi ?? this.uvi,
        clouds: clouds ?? this.clouds,
        visibility: visibility ?? this.visibility,
        windSpeed: windSpeed ?? this.windSpeed,
        windDeg: windDeg ?? this.windDeg,
        windGust: windGust ?? this.windGust,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        weather: weather ?? this.weather,
    );

    factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        temp:       json['temp'] ,
        feelsLike:  json['feels_like'] ,
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi:      json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'] ,
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'],
        // weather: List<Weather>.from(json['weather'].map((x) => Weather.fromMap(x))),
        weather: List<Weather>.from(
          json['weather'].map(Weather.fromMap) as Iterable,
        ),
    );

    Map<String, dynamic> toMap() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp,
        'feels_like': feelsLike,
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'uvi': uvi,
        'clouds': clouds,
        'visibility': visibility,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather': List<dynamic>.from(weather!.map((x) => x.toMap())),
    };
}

class Weather {
    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    final int id;
    final String main;
    final String description;
    final String icon;

    // factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));
    factory Weather.fromJson(dynamic str) => Weather.fromMap(
      json.decode(str as String) as Map<String, dynamic>,
    );

    String toJson() => json.encode(toMap());

    // factory Weather.fromMap(Map<String, dynamic> json) => Weather(
    factory Weather.fromMap(dynamic json) => Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
    );

    Map<String, dynamic> toMap() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
    };
}

class Daily {
    Daily({
        required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.windSpeed,
        required this.windDeg,
        required this.windGust,
        required this.weather,
        required this.clouds,
        this.pop,
        this.uvi,
        this.rain,
    });

    final int dt;
    final int sunrise;
    final int sunset;
    final int moonrise;
    final int moonset;
    final dynamic moonPhase;
    final Temp temp;
    final FeelsLike feelsLike;
    final int pressure;
    final int humidity;
    final dynamic dewPoint;
    final dynamic windSpeed;
    final int windDeg;
    final dynamic windGust;
    final List<Weather> weather;
    final int clouds;
    final dynamic pop;
    final dynamic uvi;
    final dynamic rain;

    // factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));
    factory Daily.fromJson(dynamic str) => Daily.fromMap(
      json.decode(str as String) as Map<String, dynamic>,
    );

    String toJson() => json.encode(toMap());

    // factory Daily.fromMap(Map<String, dynamic> json) => Daily(
    factory Daily.fromMap(dynamic json) => Daily(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        moonrise: json['moonrise'],
        moonset: json['moonset'],
        moonPhase: json['moon_phase'],
        temp: Temp.fromMap(json['temp']),
        feelsLike: FeelsLike.fromMap(json['feels_like']),
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'] ?? 0 , 
        windSpeed: json['wind_speed'] ?? 0,
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'] ?? 0,
        // weather: List<Weather>.from(json['weather'].map((x) => Weather.fromMap(x))),
        weather: List<Weather>.from(
          json['weather'].map(Weather.fromMap) as Iterable,
        ),
        clouds: json['clouds'],
        pop: json['pop'] ?? 0,
        uvi: json['uvi'] ?? 0 ,
        rain: json['rain'] ?? 0,
    );

    Map<String, dynamic> toMap() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'temp': temp.toMap(),
        'feels_like': feelsLike.toMap(),
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather': List<dynamic>.from(weather.map((x) => x.toMap())),
        'clouds': clouds,
        'pop': pop,
        'uvi': uvi,
        'rain': rain,
    };
}

class FeelsLike {
    FeelsLike({
        required this.day,
        required this.night,
        required this.eve,
        required this.morn,
    });

    final dynamic day;
    final dynamic night;
    final dynamic eve;
    final dynamic morn;

    factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json['day'] , 
        night:json['night'],
        eve: json['eve'] ,
        morn: json['morn'],
    );

    Map<String, dynamic> toMap() => {
        'day': day,
        'night': night,
        'eve': eve,
        'morn': morn,
    };
}

class Temp {
    Temp({
        required this.day,
        required this.min,
        required this.max,
        required this.night,
        required this.eve,
        required this.morn,
    });

    final dynamic day;
    final dynamic min;
    final dynamic max;
    final dynamic night;
    final dynamic eve;
    final dynamic morn;

    factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day:json['day'] ,
        min:json['min'] ,
        max:json['max'] ,
        night:json['night'],
        eve:  json['eve']  ,
        morn: json['morn'] ,
    );

    Map<String, dynamic> toMap() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
    };
}
