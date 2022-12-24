import 'package:flutter/cupertino.dart';

class Address with ChangeNotifier {
  final String? id;
  final String? name;
  final String? orgnization;
  final String? phone;
  final String? email;
  final String? country;
  final String? street_Address;
  final String? city;
  final String? postalCode;
  Address({
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
  final List<Address> _items = [];
  List<Address> get itemsList {
    return _items;
  }

  addToList(Address adr) {
    Address temp = Address(
        id: DateTime.now().toString(),
        name: adr.name,
        city: adr.city,
        country: adr.country,
        email: adr.email,
        orgnization: adr.orgnization,
        phone: adr.phone,
        postalCode: adr.postalCode,
        street_Address: adr.street_Address);

    _items.add(temp);
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
}
