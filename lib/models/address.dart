import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:passwordmanager/db/db_helper.dart';

class Address with ChangeNotifier {
  final String? id;
  final String? uid;
  final String? name;
  final String? orgnization;
  final String? phone;
  final String? email;
  final String? country;
  final String? street_Address;
  final String? city;
  final String? postalCode;
  Address({
    required this.uid,
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.email,
    required this.orgnization,
    required this.phone,
    required this.postalCode,
    required this.street_Address,
  });
}

class AddressDate with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Address> _items = [];
  List<Address> get itemsList {
    return _items;
  }

  addToList(Address adr) {
    Address temp = Address(
      id: DateTime.now().toString(),
      name: adr.name,
      city: adr.city,
      uid: adr.uid,
      country: adr.country,
      email: adr.email,
      orgnization: adr.orgnization,
      phone: adr.phone,
      postalCode: adr.postalCode,
      street_Address: adr.street_Address,
    );

    _items.add(temp);
    Map<String, Object> data = {
      "id": DateTime.now().toString(),
      "uid": _auth.currentUser!.uid,
      "name": adr.name!,
      "city": adr.city!,
      "country": adr.country!,
      "email": adr.email!,
      "orgnization": adr.orgnization!,
      "phone": adr.phone!,
      "postalCode": adr.postalCode!,
      "street_Address": adr.street_Address!,
    };
    Address_Db_Helper.insert("Address", data);
    notifyListeners();
  }

  void upDate(String id, Address adr) {
    int idx = _items.indexWhere(
      (element) => element.id == id,
    );
    if (idx >= 0) {
      _items[idx] = adr;
    }
    notifyListeners();
  }

  Address findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void deleteAdr(String id) {
    _items.removeWhere((element) => id == element.id);
    notifyListeners();
  }

  Future<void> fatchData() async {
    final data = await Address_Db_Helper.data("Address");
    _items = data
        .map(
          (e) => Address(
            id: e['id'],
            name: e['name'],
            uid: e['uid'],
            city: e['city'],
            country: e['country'],
            email: e['email'],
            orgnization: e['orgnization'],
            phone: e['phone'],
            postalCode: e['postalCode'],
            street_Address: e["street_Address"],
          ),
        )
        .toList();
  }
}
