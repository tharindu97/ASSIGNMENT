import 'package:assignment/models/city_code_model.dart';
import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
  late final List<CityModel> cityModels;
  CityList({required this.cityModels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cityModels.length,
      itemBuilder: (context, index){
        CityModel cityModel = cityModels[index];
        return Container(
          margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                      ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                        child: Text(
                          cityModel.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:17.0, top: 5.0),
                        child: Text(
                            cityModel.description,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                  ),
                  child: Container(
                      child: Text(
                          cityModel.temp.toString() + '°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                          ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
