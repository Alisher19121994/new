import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:newtask/requestApi/model/employee_entity.dart';
import 'package:newtask/requestApi/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = "homes";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _apiList();
    _apiPost();
    _apiPut();
  }

  _apiList() {
    var logger = Logger();
    Network.GET(Network.API_employeesList, Network.paramsEmpty()).then((response) => {
        logger.w(response.toString())
        });
  }
  _apiPost(){
    EmployeeEntity employeeEntity = EmployeeEntity();
    employeeEntity.data.first.employeeName = 'Alisherbek posted';
    var logger = Logger();
    Network.POST(Network.API_create, Network.paramsCreate(employeeEntity)).then((response) => {
      logger.w(response.toString())
    });
  }
  _apiPut(){
    EmployeeEntity employeeEntity = EmployeeEntity();
    employeeEntity.data.first.employeeName = 'Alisher';
    var logger = Logger();
    Network.PUT(Network.API_update, Network.paramsUpdate(employeeEntity)).then((response) => {
      logger.w(response.toString())
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
