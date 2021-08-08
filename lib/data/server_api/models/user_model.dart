import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_todo/data/repository/repository.dart';

// UserApp userFromJson(String str) => UserApp.fromJson(json.decode(str));

String userToJson(UserApp data) => json.encode(data.toJson());

// class UserApp {
//   UserApp{
//     Hive.initFlutter();
//   }
//   UserApp({
//     required this.username,
//     required this.email,
//     required this.password,
//   });

//   String username;
//   String email;
//   String password;

//   factory UserApp.fromJson(Map<String, dynamic> json) => UserApp(
//         username: json["username"],
//         email: json["email"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "username": username,
//         "email": email,
//         "password": password,
//       };
// }

// class AuthModel extends ChangeNotifier {
//   final loginTextController = TextEditingController();
//   final passwordTextController = TextEditingController();

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   Future<void> auth(BuildContext context) async {}
// }

// class AuthProvider extends InheritedNotifier {
//   final AuthModel model;

//   AuthProvider({Key? key, required Widget child, required this.model})
//       : super(key: key, child: child);

//   static AuthProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }

//   static AuthProvider? read(BuildContext context) {
//     final widget =
//         context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
//     return widget is AuthProvider ? widget : null;
//   }
// }

class UserApp extends ChangeNotifier {
  String? _userName;
  String? _email;
  String? _password;
  String? _errorUser;
  String? _errorPassword;
  bool active = false;
  String? _serverError;

  static String? token;

  String? get getUserName => _userName;
  String? get getEmail => _email;
  String? get getPassword => _password;
  String? get errorUser => _errorUser;
  String? get errorPassword => _errorPassword;

  void setUserName(value) {
    if (value.length < 4) {
      _errorUser = "Minimum is 4 characters";
    } else {
      _errorUser = null;
      if (_password != null && _password!.length >= 8) {
        active = true;
      }
    }
  }

  void setPassword(value) {
    if (value.length < 8) {
      _errorPassword = "Minimum is 8 characters";
    } else {
      _errorPassword = null;
      if (_userName != null && _userName!.length >= 4) {
        active = true;
      }
    }
  }

  void changeData({String? userName, String? email, String? password}) {
    if (userName != null) {
      _userName = userName;
      setUserName(userName);
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
      setPassword(password);
    }
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        "username": _userName,
        "password": _password,
      };

  Future<void> auth() async {
    final _repository = Repository();
    try {
      var data = await _repository.login(_userName!, _password!);
      UserApp.token=data;
      active = false;
    } catch (e) {
      _serverError = "Auth ERROR";
      active = true;
      notifyListeners();
    }

  }
}

AuthUser authUserFromJson(String str) => AuthUser.fromJson(json.decode(str));

String authUserToJson(AuthUser data) => json.encode(data.toJson());

class AuthUser {
  AuthUser({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
