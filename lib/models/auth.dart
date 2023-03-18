import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/windows/home_page.dart';

class Auth {
  String name;
  String email;
  String password;
  Auth({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthData with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _authList = [];
  List<Auth> get authList {
    return [..._authList];
  }

  addToAuth(Auth auth) {
    Auth temp =
        Auth(name: auth.name, email: auth.email, password: auth.password);
    _authList.add(temp);
  }

  Future<void> signUp(Auth auth) async {
    UserCredential userData;
    try {
      userData = await _auth.createUserWithEmailAndPassword(
        email: auth.email,
        password: auth.password,
      );
      await FirebaseFirestore.instance
          .collection("user")
          .doc(userData.user?.uid)
          .set(
        {
          "Name": auth.name.toString(),
          "Email": auth.email.toString(),
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logIn(Auth auth, BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
            email: auth.email,
            password: auth.password,
          )
          .then(
            (value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => MyHomePage())),
            ),
          );
    } catch (error) {
      throw error;
    }
  }
}

class Controller {
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;
}
