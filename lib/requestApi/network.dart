import 'dart:convert';

import 'package:http/http.dart';
import 'package:newtask/requestApi/model/employee_entity.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";

  //http Apis
  static String API_employeesList = '/api/v1/employees';
  static String API_singleEmployeeList = '/api/v1/employee/1';
  static String API_create = '/api/v1/create';
  static String API_update = '/api/v1/update/21';
  static String API_delete = '/api/v1/delete/2';

  /* Http Request */

  //GET
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //POST
  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: {'Content-Type': 'application/json; charset=UTF-8'},body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  //PUT
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: {'Content-Type': 'application/json; charset=UTF-8'},body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //DELETE
  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Parameters */

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = Map();
    return params;
  }

  //paramsCreate
  static Map<String,String> paramsCreate(EmployeeEntity employeeEntity){
    Map<String,String> params = Map();
    params.addAll({
      'employeeName': employeeEntity.data.first.employeeName,
      'employeeSalary': employeeEntity.data.first.employeeSalary.toString(),
      'employeeAge': employeeEntity.data.first.employeeAge.toString(),
      'profileImage': employeeEntity.data.first.profileImage,
    });
    return params;
  }

  //paramsUpdate
  static Map<String,String> paramsUpdate(EmployeeEntity employeeEntity){
    Map<String,String> params = Map();
    params.addAll({
      'id': employeeEntity.data.first.id.toString(),
      'employeeName': employeeEntity.data.first.employeeName,
      'employeeSalary': employeeEntity.data.first.employeeSalary.toString(),
      'employeeAge': employeeEntity.data.first.employeeAge.toString(),
      'profileImage': employeeEntity.data.first.profileImage,
    });
    return params;
  }





}
