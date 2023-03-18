import '../Address/adres.dart';
import '../password/password.dart';

final List<Map<String, dynamic>> pages = [
  {
    "title": "Password",
    "page": const PasswordScreen(),
  },
  {
    "title": "Address",
    "page": const AddressScreen(),
  },
];
