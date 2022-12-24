import 'package:flutter/cupertino.dart';

class Auth {
  String email;
  String password;
  Auth({required this.email, required this.password});
}

class AuthData with ChangeNotifier {
  final _authList = [];
  List<Auth> get authList {
    return [..._authList];
  }

  addToAuth(Auth auth) {
    Auth temp = Auth(email: auth.email, password: auth.password);
    _authList.add(temp);
  }
}
