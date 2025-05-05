import 'package:day4/models/wether-api.dart';
import 'package:day4/service/http_server.dart';
import 'package:flutter/material.dart';

class WeatherUi extends StatefulWidget {
  final String location;

  const WeatherUi({super.key, required this.location});

  @override
  State<WeatherUi> createState() => _WeatherUiState();
}

class _WeatherUiState extends State<WeatherUi> {
  late Future<WeatherModel> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService().fetchWeather(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF08244F),
              Color(0xFF134CB5),
              Color(0xFF0B42AB),
            ],
            stops: [0.0, 0.4738, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 36),
              Row(children: [Image.asset('assets/images/Group 654.png')]),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset('assets/images/W.png', width: 10),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Image.asset('assets/images/weather.png'),
                      SizedBox(height: 8),
                      Image.asset('assets/images/App.png'),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/images/Sun cloud angled rain.png'),

              FutureBuilder<WeatherModel>(
                future: weatherData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    );
                  } else if (!snapshot.hasData) {
                    return Text(
                      'No data available',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    WeatherModel data = snapshot.data!;
                    return Column(
                      children: [
                        Text(
                          '${data.temp}ºC',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Precipitations',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Max: ${data.tempMax}º',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Min: ${data.tempMin}º',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 43, 102),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Group.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '${data.humidity}%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Group (1).png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${data.windSpeed} km/h',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 66, 155),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Mars,19',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000D1B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${data.temp}º C',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 5),

                                        Image.asset(
                                          'assets/images/Union.png',
                                          width: 20,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '18.00',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000D1B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${data.tempMin}º C',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 5),

                                        Image.asset(
                                          'assets/images/Group 650.png',
                                          width: 50,
                                        ),
                                        SizedBox(height: 5),

                                        Text(
                                          '17',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000D1B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${data.tempMax}º C',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 5),

                                        Image.asset(
                                          'assets/images/Sun cloud angled rain.png',
                                          width: 40,
                                        ),
                                        SizedBox(height: 5),

                                        Text(
                                          '16.00',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000D1B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          '${data.tempMax}º C',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 5),

                                        Image.asset(
                                          'assets/images/Union.png',
                                          width: 20,
                                        ),
                                        SizedBox(height: 5),

                                        Text(
                                          '18.00',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
