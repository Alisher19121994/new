class UserSignUp {
  String? username;
  String? email;
  String? phoneNumber;
  String? password;

  UserSignUp(this.username, this.email, this.phoneNumber, this.password);

  UserSignUp.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
