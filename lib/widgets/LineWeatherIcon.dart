import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class LineWeatherIcon extends StatefulWidget {
  final String baseWeatherIconCode;
  final String potencialWeatherIconCode;

  const LineWeatherIcon(
      {Key key,
      this.baseWeatherIconCode = 'wi-day-sunny',
      @required this.potencialWeatherIconCode})
      : super(key: key);
  @override
  _LineWeatherIconState createState() => _LineWeatherIconState();
}

class _LineWeatherIconState extends State<LineWeatherIcon> {
  bool weatherActive = false;

  // TODO: animate changes of alignemt and size
  Widget _buildBaseWeather() {
    return Align(
      alignment: weatherActive ? Alignment.bottomRight : Alignment.topLeft,
      child: Icon(
        WeatherIcons.fromString(widget.baseWeatherIconCode),
        color: weatherActive ? Colors.white : Colors.black,
        size: weatherActive ? 15 : 25,
      ),
    );
  }

  Widget _buildLineWeather() {
    return Align(
      alignment: weatherActive ? Alignment.topLeft : Alignment.bottomRight,
      child: Icon(
        WeatherIcons.fromString(widget.potencialWeatherIconCode),
        color: weatherActive ? Colors.black : Colors.white,
        size: weatherActive ? 25 : 15,
      ),
    );
  }

  List<Widget> _buildWeatherStack() {
    if (this.weatherActive) {
      return [_buildBaseWeather(), _buildLineWeather()];
    } else {
      return [_buildLineWeather(), _buildBaseWeather()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 30,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () => {
          setState(() {
            weatherActive = !weatherActive;
          })
        },
        child: Stack(
          children: _buildWeatherStack(),
        ),
      ),
    );
  }
}
