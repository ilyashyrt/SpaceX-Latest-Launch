import 'package:http/http.dart' as http;
import 'package:spacex_app/model.dart';

class HttpService{
   Future<SpaceX> getData() async {
    final response = await http.get(Uri.parse(
        'https://api.spacexdata.com/v4/launches/latest'));
    if (response.statusCode == 200) {
      return spaceXFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }
}