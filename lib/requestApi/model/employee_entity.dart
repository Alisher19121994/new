import 'package:newtask/generated/json/base/json_field.dart';
import 'package:newtask/generated/json/employee_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EmployeeEntity {
	late String status;
	late List<EmployeeData> data;
	late String message;

	EmployeeEntity();

	factory EmployeeEntity.fromJson(Map<String, dynamic> json) => $EmployeeEntityFromJson(json);

	Map<String, dynamic> toJson() => $EmployeeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class EmployeeData {
	late int id;
	@JSONField(name: "employee_name")
	late String employeeName;
	@JSONField(name: "employee_salary")
	late int employeeSalary;
	@JSONField(name: "employee_age")
	late int employeeAge;
	@JSONField(name: "profile_image")
	late String profileImage;

	EmployeeData();

	factory EmployeeData.fromJson(Map<String, dynamic> json) => $EmployeeDataFromJson(json);

	Map<String, dynamic> toJson() => $EmployeeDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}