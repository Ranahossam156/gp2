class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final int phoneNumber;
  late final String password;
  late final String confirmPassword;
  
  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    _data['confirmPassword'] = confirmPassword;
    return _data;
  }
}