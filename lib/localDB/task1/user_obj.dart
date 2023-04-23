import 'package:hive/hive.dart';

class UserLogin {

  String? userName;
  String? password;

  UserLogin(this.userName, this.password);

  UserLogin.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
      };
}
