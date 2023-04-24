import 'package:hive/hive.dart';
import 'package:newtask/localDB/task1/sign_up_obj.dart';

class HiveDatabase {
  static var box = Hive.box("sign_up_database");

  static void saveData(UserSignUp userLogin) {
    box.put("users", userLogin.toJson());
  }

  static UserSignUp fetchData() {
    var userLogin = UserSignUp.fromJson(box.get("users"));
    return userLogin;
  }

  static void removeData() async {
    box.delete("users");
  }
}
