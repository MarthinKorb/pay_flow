import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', user.toJson());
  }

  Future<void> getCurrentUser(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (sharedPreferences.containsKey('user')) {
      final json = sharedPreferences.getString('user');
      setUser(context, UserModel.fromJson(json!));
    } else {
      setUser(context, null);
    }
  }

  Future<UserModel?> getUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final json = sharedPreferences.getString('user');
    return UserModel.fromJson(json!);
  }
}
