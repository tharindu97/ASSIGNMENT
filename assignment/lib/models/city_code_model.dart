class CityModel{

  late final int id;
  late final String name;
  late final String description;
  late final double temp;

  CityModel({required this.id, required this.name, required this.description, required this.temp});

  int get getId => id;
  String get getName => name;
  String get getDescription => description;
  double get getTemp => temp;

  @override
  String toString() {
    return 'CityModel{id: $id, name: $name, description: $description, temp: $temp}';
  }
}