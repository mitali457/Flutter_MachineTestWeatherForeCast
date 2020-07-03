import 'package:flutter/material.dart';
import 'package:machinetest/helper/weatherdetails.dart';
import 'package:machinetest/models/weatherforecast.dart';
import 'package:intl/intl.dart';

class Homescreen extends StatefulWidget {
  final WeatherForecast weatherdetails;
  Homescreen({
    this.weatherdetails,
  });
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController cityController = TextEditingController();
  bool _loading = true;
  void getWeather(String text) async {
      setState(() {
      _loading = true;
    });
    await weatherData.getWeather(city:text );
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather('Kolkata');
    // _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    print(_loading);
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.pink[900],
              Colors.purple[700],
              Colors.purple[600],
              Colors.purple[400],
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60, left: 50),
                            child: Text(DateFormat.yMMMEd().format(new DateTime.now()),
                             // weatherData.weather.current.isDay,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(DateFormat.Hm().format(DateTime.parse( weatherData.weather.location.localtime)),
                                   
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'pm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 160),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  weatherData.weather.current.weatherIcons[0],
                                  height: 90,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${weatherData.weather.current.temperature.round().toString()} ° c',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                color: Colors.white,
                                height: 50,
                                width: 2,
                              ),

                              //Divider(color: Colors.black,),

                              Column(
                                children: [
                                  Text(
                                    weatherData.weather.current.weatherDescriptions[0]
                                        ,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height:10),
                                   Text(
                                    weatherData.weather.location.country
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, top: 300),
                                child: Container(
                                  width: 200,
                                  height: 45,
                                  padding: EdgeInsets.only(
                                      top: 4, left: 30, right: 16, bottom: 4),
                                  decoration: BoxDecoration(
                                      //border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.purple, blurRadius: 5)
                                      ]),
                                  child: TextFormField(
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Enter a City name',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 300),
                                child: Container(
                                  width: 70,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      //border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.purple, blurRadius: 5)
                                      ]),
                                  child: IconButton(
                                    onPressed: () {
                                  getWeather(cityController.text);
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.purple,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
            )));
  }
}
