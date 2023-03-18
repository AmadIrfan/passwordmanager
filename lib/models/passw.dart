import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/db/db_helper.dart';

class Password with ChangeNotifier {
  String? id;
  String? uid;
  String? webSite;
  String? uName;
  String? password;
  DateTime? addedDate;
  Password(
      {required this.webSite,
      required this.uName,
      required this.id,
      required this.uid,
      required this.password,
      required this.addedDate});
  Password.named({required this.uName, required this.password});
  Password.webSites({required this.webSite});
}

class PasswordData with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late List<Password> _itemList = [
    // Password(
    //     id: DateTime.now().toString(),
    //     webSite: 'webSite',
    //     uName: 'uName',
    //     password: "password",
    //     addedDate: DateTime.now()),
    // Password(
    //   id: DateTime.now().toString(),
    //   webSite: 'webSite1',
    //   uName: 'uName1',
    //   password: "password1",
    //   addedDate: DateTime.now(),
    // ),
    // Password(
    //   webSite: 'webSite2',
    //   id: DateTime.now().toString(),
    //   uName: 'uName2',
    //   password: "password2",
    //   addedDate: DateTime.now(),
    // ),
    // Password(
    //   id: DateTime.now().toString(),
    //   webSite: 'webSite3',
    //   uName: 'uName3',
    //   password: "password3",
    //   addedDate: DateTime.now(),
    // ),
    // Password(
    //   id: DateTime.now().toString(),
    //   webSite: 'webSite4',
    //   uName: 'uName4',
    //   password: "password4",
    //   addedDate: DateTime.now(),
    // ),
  ];

  List<Password> get passItem {
    return _itemList;
  }

  void addInList(Password pas) {
    Password temp = Password(
        id: DateTime.now().toString(),
        webSite: pas.webSite,
        uName: pas.uName,
        uid: pas.uid,
        password: pas.password,
        addedDate: pas.addedDate);
    _itemList.insert(0, temp);
    notifyListeners();
    Map<String, Object> data = {
      "id": temp.id!,
      'uid': _auth.currentUser!.uid,
      "name": temp.uName!,
      "web": temp.webSite!,
      "password": temp.password!,
      "date": temp.addedDate!.toString(),
    };
    Password_DbHelper.insertData("password", data);
  }

  String getChar(String web) {
    if (web.isNotEmpty) {
      return web[0].toString();
    } else {
      return "#";
    }
  }

  Password findById(String? id) {
    return _itemList.firstWhere(
      (element) => element.id == id,
    );
  }

  upDate(String? id, Password pass) {
    int idx = _itemList.indexWhere(
      (element) => element.id == id,
    );
    if (idx >= 0) {
      _itemList[idx] = pass;
    }
    notifyListeners();
  }

  deletePass(String id) {
    _itemList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> fatchDataDB() async {
    final dataList = await Password_DbHelper.getData("password");
    _itemList = dataList
        .map(
          (e) => Password(
            webSite: e["web"],
            uName: e["name"],
            id: e["id"],
            uid: e['uid'],
            password: e["password"],
            addedDate: DateTime.parse(e["id"]),
          ),
        )
        .toList();

    notifyListeners();
  }
}
