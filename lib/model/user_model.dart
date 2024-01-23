
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class User{
  String id;
  String email;
  String password;
  User(this.id,this.email,this.password);
  User.fromJson(Map<String,dynamic>json)
  :id = json['id'],
  email = json['email'],
  password = json['password'];

  Map<String,dynamic> toJson() =>{
    'id':id,
    'email':email,
    'password':password
  };

  static StoreUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    await prefs.setString('user', stringUser);
  }
  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("user");
    if(stringUser == null || stringUser.isEmpty) return null;
    Map<String,dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool?> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }

}