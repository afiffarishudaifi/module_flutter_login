// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

const int ANIMATED_BODY_MS = 500;
const String baseUrl = "https://bimbelneutronmadiun.my.id/api";

Future<int> getIdUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int id = await prefs.getInt('id') ?? 0;
  return id;
}

Future<String> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? nama = await prefs.getString('nama');
  return nama!;
}
