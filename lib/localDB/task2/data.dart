import 'package:hive/hive.dart';

import '../task1/user_obj.dart';
import 'obj.dart';

class HiveServices {
  static var box = Hive.box("database");

  static void saveUser(UserLogins user) {
    box.put("a", user.toJson());
  }

  static UserLogins fetchUser(){
    var user = UserLogins.fromJson(box.get("a"));
    return user;
  }

  static void removeUser()async{
    box.delete("a");
  }

  static void updateUser(UserLogins user){
    box.putAt(0, user);
  }

}