import 'package:newtask/generated/json/base/json_convert_content.dart';
import 'package:newtask/requestApi/model/employee_entity.dart';

EmployeeEntity $EmployeeEntityFromJson(Map<String, dynamic> json) {
	final EmployeeEntity employeeEntity = EmployeeEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		employeeEntity.status = status;
	}
	final List<EmployeeData>? data = jsonConvert.convertListNotNull<EmployeeData>(json['data']);
	if (data != null) {
		employeeEntity.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		employeeEntity.message = message;
	}
	return employeeEntity;
}

Map<String, dynamic> $EmployeeEntityToJson(EmployeeEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	data['message'] = entity.message;
	return data;
}

EmployeeData $EmployeeDataFromJson(Map<String, dynamic> json) {
	final EmployeeData employeeData = EmployeeData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		employeeData.id = id;
	}
	final String? employeeName = jsonConvert.convert<String>(json['employee_name']);
	if (employeeName != null) {
		employeeData.employeeName = employeeName;
	}
	final int? employeeSalary = jsonConvert.convert<int>(json['employee_salary']);
	if (employeeSalary != null) {
		employeeData.employeeSalary = employeeSalary;
	}
	final int? employeeAge = jsonConvert.convert<int>(json['employee_age']);
	if (employeeAge != null) {
		employeeData.employeeAge = employeeAge;
	}
	final String? profileImage = jsonConvert.convert<String>(json['profile_image']);
	if (profileImage != null) {
		employeeData.profileImage = profileImage;
	}
	return employeeData;
}

Map<String, dynamic> $EmployeeDataToJson(EmployeeData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['employee_name'] = entity.employeeName;
	data['employee_salary'] = entity.employeeSalary;
	data['employee_age'] = entity.employeeAge;
	data['profile_image'] = entity.profileImage;
	return data;
}