import 'package:passwordmanager/info/device_info.dart';
import '../Account/account.dart';
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
  {
    "title": "Info",
    "page": const DeviceInfo(),
  },
  {
    "title": "Account",
    "page": const Accounts(),
  },
];
