import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:newtask/shared/account/registration.dart';
import 'package:newtask/shared/serviceClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static saveData(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = jsonEncode(user);
    await preferences.setString("user", data);
  }

  static Future<User?> fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? data = preferences.getString("user");
    if (data == null || data.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(data);
    return User.fromJson(map);
  }

  static Future<bool> removeUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("user");
  }


  static saveReg(Registration registration)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data  = jsonEncode(registration);
    await preferences.setString("save", data);

  }
  static Future<Registration?> fetchReg()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? data = preferences.getString("save");
    if(data == null || data.isEmpty) return null;
    Map<String,dynamic> map = jsonDecode(data);
    return Registration.fromJson(map);

  }

  static saveSecure(Registration registration)async{
    const storage = FlutterSecureStorage();
    await storage.write(key: "registration", value: registration.password);
  }
}
