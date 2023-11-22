import 'condition.dart';

class Day {
  num? maxtempC;
  num? maxtempF;
  num? mintempC;
  num? mintempF;
  num? avgtempC;
  num? avgtempF;
  num? maxwindMph;
  num? maxwindKph;
  num? totalprecipMm;
  num? totalprecipIn;
  num? totalsnowCm;
  num? avgvisKm;
  num? avgvisMiles;
  num? avghumidity;
  num? dailyWillItRain;
  num? dailyChanceOfRain;
  num? dailyWillItSnow;
  num? dailyChanceOfSnow;
  Condition? condition;
  num? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: json['maxtemp_f'] as num?,
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        mintempF: (json['mintemp_f'] as num?)?.toDouble(),
        avgtempC: json['avgtemp_c'] as num?,
        avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
        totalprecipIn: json['totalprecip_in'] as num?,
        totalsnowCm: json['totalsnow_cm'] as num?,
        avgvisKm: json['avgvis_km'] as num?,
        avgvisMiles: json['avgvis_miles'] as num?,
        avghumidity: json['avghumidity'] as num?,
        dailyWillItRain: json['daily_will_it_rain'] as num?,
        dailyChanceOfRain: json['daily_chance_of_rain'] as num?,
        dailyWillItSnow: json['daily_will_it_snow'] as num?,
        dailyChanceOfSnow: json['daily_chance_of_snow'] as num?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: json['uv'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}
