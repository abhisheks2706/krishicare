class Weather {
  String? cityName;
  double? temp;
  int? humidity;
  double? wind;
  double? feels_like;
  int? pressure;

  Weather({
    this.cityName,
    this.temp,
    this.humidity,
    this.wind,
    this.feels_like,
    this.pressure,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressur"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}
