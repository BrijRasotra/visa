import 'package:shared_preferences/shared_preferences.dart';

Future<void> localStore(String email) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("email", email);
}

Future<String?> getEmail() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("email");
}

clearDataBase() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
