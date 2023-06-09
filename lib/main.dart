import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newtask/localDB/task1/sign_in_page.dart';
import 'package:newtask/localDB/task1/sign_up_page.dart';
import 'package:newtask/localDB/task2/sign_in_page.dart';
import 'package:newtask/requestApi/home.dart';
import 'package:newtask/shared/account/account_page.dart';

import 'localDB/task2/sign_up_page.dart';



void main() async {
  // hive local database
  await Hive.initFlutter();
  await Hive.openBox("my_database");
  await Hive.openBox("sign_up_database");
  await Hive.openBox("database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        SignUpPage.id: (context) => const SignUpPage(),
      },
    );
  }
}
