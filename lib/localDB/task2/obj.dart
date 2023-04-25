class UserLogins {

  String? userName;
  String? password;

  UserLogins(this.userName, this.password);

  UserLogins.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'password': password,
  };
}