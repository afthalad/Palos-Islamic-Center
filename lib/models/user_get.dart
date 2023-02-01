import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userget {
  Dio dio = Dio();
  static var nam;
  static var image;
  static var token;
  static var email;

  Future fetchUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["Accept"] = "application/json";
      dio.options.headers["Content-Type"] = "application/json";

      Response response = await dio.post("http://52.90.175.175/api/user/get");

      nam = response.data['data']["name"];
      image = response.data['data']["image"];
      email = response.data['data']["email"];
      // print(token);
      // print(email);
    } catch (ex) {
      rethrow;
    }
  }
}
