import 'dart:convert';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> weatherData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String data =
    '''[
        {
            "city": "New York",
            "temperature": 20,
            "condition": "Clear",
            "humidity": 60,
            "windSpeed": 5.5
        },
        {
        "city": "Los Angeles",

"temperature": 25,

"condition": "Sunny",

"humidity": 50,

"windSpeed": 6.8
},
        {
            "city": "London",
            "temperature": 15,
            "condition": "Partly Cloudy",
            "humidity": 70,
            "windSpeed": 4.2
        },
        {
            "city": "Tokyo",
            "temperature": 28,
            "condition": "Rainy",
            "humidity": 75,
            "windSpeed": 8.0
        },
        {
            "city": "Sydney",
            "temperature": 22,
            "condition": "Cloudy",
            "humidity": 55,
            "windSpeed": 7.3
        }
    ]''';

    setState(() {
      weatherData = json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(weatherData[index]['city']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${weatherData[index]['temperature']}'),
                    Text('Condition: ${weatherData[index]['condition']}'),
                    Text('Humidity: ${weatherData[index]['humidity']}'),
                    Text('Wind Speed: ${weatherData[index]['windSpeed']}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
