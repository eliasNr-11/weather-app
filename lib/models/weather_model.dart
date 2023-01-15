import 'dart:convert';

WeatherModel? weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

class WeatherModel {
    WeatherModel({
        this.cod,
        this.message,
        this.cnt,
        this.list,
        this.city,
    });

    String? cod;
    int? message;
    int? cnt;
    List<ListElement?>? list;
    City? city;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null ? [] : List<ListElement?>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
    );
}

class City {
    City({
        this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset,
    });

    int? id;
    String? name;
    Coord? coord;
    String? country;
    int? population;
    int? timezone;
    int? sunrise;
    int? sunset;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );
}

class Coord {
    Coord({
        this.lat,
        this.lon,
    });

    double? lat;
    double? lon;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );
}

class ListElement {
    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
    });

    int? dt;
    MainClass? main;
    List<Weather?>? weather;
    Clouds? clouds;
    Wind? wind;
    int? visibility;
    double? pop;
    Sys? sys;
    DateTime? dtTxt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: json["weather"] == null ? [] : List<Weather?>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"].toDouble(),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
    );
}

class Clouds {
    Clouds({
        this.all,
    });

    int? all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );
}

class MainClass {
    MainClass({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });

    double? temp;
    double? feelsLike;
    double? tempMin;
    double? tempMax;
    int? pressure;
    int? seaLevel;
    int? grndLevel;
    int? humidity;
    double? tempKf;

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
    );
}

class Sys {
    Sys({
        this.pod,
    });

    Pod? pod;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]],
    );
}

enum Pod { D, N }

final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int? id;
    String? main;
    String? description;
    String? icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );
}

class Wind {
    Wind({
        this.speed,
        this.deg,
        this.gust,
    });

    double? speed;
    int? deg;
    double? gust;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
    );
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
