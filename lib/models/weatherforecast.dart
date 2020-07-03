class WeatherForecast {
  Request request;
  Location location;
  Current current;
  Forecast forecast;

  WeatherForecast({this.request, this.location, this.current, this.forecast});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    request =
        json['request'] != null ? new Request.fromJson(json['request']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.request != null) {
      data['request'] = this.request.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast.toJson();
    }
    return data;
  }
}

class Request {
  String type;
  String query;
  String language;
  String unit;

  Request({this.type, this.query, this.language, this.unit});

  Request.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'];
    language = json['language'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['query'] = this.query;
    data['language'] = this.language;
    data['unit'] = this.unit;
    return data;
  }
}

class Location {
  String name;
  String country;
  String region;
  String lat;
  String lon;
  String timezoneId;
  String localtime;
  int localtimeEpoch;
  String utcOffset;

  Location(
      {this.name,
      this.country,
      this.region,
      this.lat,
      this.lon,
      this.timezoneId,
      this.localtime,
      this.localtimeEpoch,
      this.utcOffset});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
    timezoneId = json['timezone_id'];
    localtime = json['localtime'];
    localtimeEpoch = json['localtime_epoch'];
    utcOffset = json['utc_offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['region'] = this.region;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone_id'] = this.timezoneId;
    data['localtime'] = this.localtime;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['utc_offset'] = this.utcOffset;
    return data;
  }
}

class Current {
  String observationTime;
  int temperature;
  int weatherCode;
  List<String> weatherIcons;
  List<String> weatherDescriptions;
  int windSpeed;
  int windDegree;
  String windDir;
  int pressure;
  // double precip;
  int humidity;
  int cloudcover;
  int feelslike;
  int uvIndex;
  int visibility;
  String isDay;

  Current(
      {this.observationTime,
      this.temperature,
      this.weatherCode,
      this.weatherIcons,
      this.weatherDescriptions,
      this.windSpeed,
      this.windDegree,
      this.windDir,
      this.pressure,
      // this.precip,
      this.humidity,
      this.cloudcover,
      this.feelslike,
      this.uvIndex,
      this.visibility,
      this.isDay});

  Current.fromJson(Map<String, dynamic> json) {
    observationTime = json['observation_time'];
    temperature = json['temperature'];
    weatherCode = json['weather_code'];
    weatherIcons = json['weather_icons'].cast<String>();
    weatherDescriptions = json['weather_descriptions'].cast<String>();
    windSpeed = json['wind_speed'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressure = json['pressure'];
    // precip = json['precip'];
    humidity = json['humidity'];
    cloudcover = json['cloudcover'];
    feelslike = json['feelslike'];
    uvIndex = json['uv_index'];
    visibility = json['visibility'];
    isDay = json['is_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['observation_time'] = this.observationTime;
    data['temperature'] = this.temperature;
    data['weather_code'] = this.weatherCode;
    data['weather_icons'] = this.weatherIcons;
    data['weather_descriptions'] = this.weatherDescriptions;
    data['wind_speed'] = this.windSpeed;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure'] = this.pressure;
    // data['precip'] = this.precip;
    data['humidity'] = this.humidity;
    data['cloudcover'] = this.cloudcover;
    data['feelslike'] = this.feelslike;
    data['uv_index'] = this.uvIndex;
    data['visibility'] = this.visibility;
    data['is_day'] = this.isDay;
    return data;
  }
}

class Forecast {
  ForecastTodayDate forecastTodayDate;

  Forecast({this.forecastTodayDate});

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastTodayDate = json['forecast-today-date'] != null
        ? new ForecastTodayDate.fromJson(json['forecast-today-date'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastTodayDate != null) {
      data['forecast-today-date'] = this.forecastTodayDate.toJson();
    }
    return data;
  }
}

class ForecastTodayDate {
  String date;
  int dateEpoch;
  Astro astro;
  int mintemp;
  int maxtemp;
  int avgtemp;
  int totalsnow;
  // double sunhour;
  int uvIndex;

  ForecastTodayDate(
      {this.date,
      this.dateEpoch,
      this.astro,
      this.mintemp,
      this.maxtemp,
      this.avgtemp,
      this.totalsnow,
      // this.sunhour,
      this.uvIndex});

  ForecastTodayDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    mintemp = json['mintemp'];
    maxtemp = json['maxtemp'];
    avgtemp = json['avgtemp'];
    totalsnow = json['totalsnow'];
    // sunhour = json['sunhour'];
    uvIndex = json['uv_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    if (this.astro != null) {
      data['astro'] = this.astro.toJson();
    }
    data['mintemp'] = this.mintemp;
    data['maxtemp'] = this.maxtemp;
    data['avgtemp'] = this.avgtemp;
    data['totalsnow'] = this.totalsnow;
    // data['sunhour'] = this.sunhour;
    data['uv_index'] = this.uvIndex;
    return data;
  }
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  int moonIllumination;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    return data;
  }
}
