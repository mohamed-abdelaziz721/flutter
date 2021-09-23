import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/model/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
    'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
    name: 'Mohamed Abdelaziz',
    email: 'mohamed.abdelaziz@gmail.com',
    about:
    'Senior Systems and Biomedical Engineering student at Cairo university interested in computer vision, medical imaging, and machine learning. NAID mobile development internship summer 2021.',
    isDarkMode: false,
  );


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}