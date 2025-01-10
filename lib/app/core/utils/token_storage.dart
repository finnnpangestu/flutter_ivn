import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAccessToken(String token) async {
  final perfs = await SharedPreferences.getInstance();
  await perfs.setString('accessToken', token);
}

Future<String?> getAccessToken() async {
  final perfs = await SharedPreferences.getInstance();
  return perfs.getString('accessToken');
}
