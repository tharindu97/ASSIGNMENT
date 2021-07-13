import 'dart:async';
import 'package:assignment/config.dart';
import 'package:assignment/models/city_code_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> readJsonData() async{
  final jsondata = await rootBundle.rootBundle.loadString('CityCode/Step1.json');
  return Map<String, dynamic>.from(json.decode(jsondata));
}

Future<List<CityModel>>cityCode() async{

  var readData =  await readJsonData();
  List listData = readData['List'];
  String cityList = "";

  listData.forEach((element) {
    cityList = cityList + ',' +  element['CityCode'];
  });
  var url = "${Config.BACKEND_URL}?id="+cityList+"&units=metric&appid=72bd7a2b86d2b85493bb239c4a538113";
  final response = await http.get(
    Uri.parse(url),
  );

  var responseMap =  jsonDecode(response.body);

  List<CityModel> cityModels = [];
  List responseMapSimple = responseMap['list'];

  responseMapSimple.forEach((element) {
    CityModel cityModel = CityModel(id: element['id'], name: element['name'], description: element['weather'][0]['description'], temp: element['main']['temp']);
    cityModels.add(cityModel);
  });

  return cityModels;
}


