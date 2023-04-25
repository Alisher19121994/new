import 'package:hive/hive.dart';
import 'package:newtask/localDB/task1/user_obj.dart';
import 'package:newtask/shared/serviceClass.dart';

class HiveService {
  static var box = Hive.box("database");

  static void saveUser(UserLogin user) {
    box.put("a", user.toJson());
  }

  static UserLogin fetchUser(){
    var user = UserLogin.fromJson(box.get("a"));
    return user;
  }

  static void removeUser()async{
    box.delete("a");
  }

  static void updateUser(UserLogin user){
    box.putAt(0, user);
  }

}
