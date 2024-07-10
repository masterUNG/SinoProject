import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class UserModel {

  final String user_id;
  final String staffname;
  final String username;
  final String password;
  final String user_email;
  final String user_phone;
  final String user_adress;
  final String user_img;
  UserModel({
    required this.user_id,
    required this.staffname,
    required this.username,
    required this.password,
    required this.user_email,
    required this.user_phone,
    required this.user_adress,
    required this.user_img,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'staffname': staffname,
      'username': username,
      'password': password,
      'user_email': user_email,
      'user_phone': user_phone,
      'user_adress': user_adress,
      'user_img': user_img,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: (map['user_id'] ?? '') as String,
      staffname: (map['staffname'] ?? '') as String,
      username: (map['username'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      user_email: (map['user_email'] ?? '') as String,
      user_phone: (map['user_phone'] ?? '') as String,
      user_adress: (map['user_adress'] ?? '') as String,
      user_img: (map['user_img'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
