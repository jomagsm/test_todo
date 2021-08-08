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
  bool _activeButton = false;
  bool _authSuccess = false;
  String? _serverError;

  static String? token= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjI4NDQ5MjI1LCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjI4NDQ1NjI1fQ.-4LuzPTuiXjAnH0aJQpkiWBbDbiwAHrtdk14KCNApQw';

  String? get getUserName => _userName;
  String? get getEmail => _email;
  String? get getPassword => _password;
  String? get errorUser => _errorUser;
  String? get errorPassword => _errorPassword;
  bool get activeButton => _activeButton;
  bool get authSuccess => _authSuccess;

  void setUserName(value) {
    if (value.length < 4) {
      _errorUser = "Minimum is 4 characters";
    } else {
      _errorUser = null;
      if (_password != null && _password!.length >= 8) {
        _activeButton = true;
      }
    }
  }

  void setPassword(value) {
    if (value.length < 8) {
      _errorPassword = "Minimum is 8 characters";
    } else {
      _errorPassword = null;
      if (_userName != null && _userName!.length >= 4) {
        _activeButton = true;
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
      UserApp.token = data;
      _activeButton = false;
      _authSuccess = true;
    } catch (e) {
      _serverError = "Auth ERROR";
      _activeButton = true;
    }
    notifyListeners();
  }
}
