import 'package:hive/hive.dart';
import 'package:newtask/localDB/task1/user_obj.dart';
import 'package:newtask/shared/serviceClass.dart';

class HiveService {
  static var box = Hive.box("my_database");

  static void saveUser(UserLogin user) {
    box.put("user", user.toJson());
  }

  static UserLogin fetchUser(){
    var user = UserLogin.fromJson(box.get("user"));
    return user;
  }

  static void removeUser()async{
    box.delete("user");
  }

  static void updateUser(UserLogin user){
    box.putAt(0, user);
  }

}
