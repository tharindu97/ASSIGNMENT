import 'dart:async';
import 'package:assignment/data/step_read.dart';
import 'package:assignment/models/city_code_model.dart';
import 'package:assignment/widgets/city_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = './home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<CityModel>> _cityModelsFuture = cityCode();

  @override
  void initState() {
    super.initState();
    setUpTimedFetch();
  }

  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 60000), (timer) {
      setState(() {
        _cityModelsFuture = cityCode();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: FutureBuilder<List<CityModel>?>(
        future: _cityModelsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error...!"),
            );
          } else if (snapshot.hasData) {
            List<CityModel>? cityCode = snapshot.data;
            return cityCode != null
                ? CityList(cityModels: cityCode)
                : Center(
                    child: Text("Nothing to show Weathers!.."),
                );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
