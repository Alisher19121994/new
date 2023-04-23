import 'package:flutter/material.dart';
import 'package:newtask/localDB/hive_service.dart';
import 'package:newtask/localDB/userData.dart';
import 'package:newtask/shared/serviceClass.dart';

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {


  @override
  void initState() {
    super.initState();

    // var users = User("alish@gmail.com", "123qwe");
    // HiveService.saveUser(users);
    // HiveService.fetchUser();
    // HiveService.removeUser();
    //HiveService.updateUser(users.email);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }
}
