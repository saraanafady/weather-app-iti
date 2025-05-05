import 'package:day4/screens/weather-ui.dart';
import 'package:day4/widget/custombutton.dart';
import 'package:day4/widget/customtextfiked.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/W.png'),
                SizedBox(width: 10),
                Column(
                  children: [
                    Image.asset('assets/images/weather.png'),
                    SizedBox(height: 20),
                    Image.asset('assets/images/App.png'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            Image.asset('assets/images/Sun cloud angled rain.png'),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextFiled(
                    hittext: 'Enter location',
                    prefixIcon: Icon(Icons.search),
                    controller: _controller,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomButtoms(
                    onPressed: () {
                      String location = _controller.text;

                      if (location.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherUi(location: location),
                          ),
                        );
                      }
                    },
                    text: 'Check',
                    color: Color.fromARGB(255, 1, 58, 144),
                    textcolor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
