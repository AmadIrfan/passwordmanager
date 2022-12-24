import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Address/address_detail.dart';
import '../Address/add_address.dart';
import '../models/passw.dart';
import '../password/add_password.dart';
import '../password/pass_detail.dart';
import '../windows/spleash.dart';
import '../models/address.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => PasswordData()),
        ),
        ChangeNotifierProvider(
          create: ((context) => AddressDate()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        // home: const SplashScreen(),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          AddressDetails.routeName: (context) => const AddressDetails(),
          PassPageDetails.routeName: (context) => const PassPageDetails(),
          AddAddress.routeName: (context) => const AddAddress(),
          AddPassword.routeName: (context) => const AddPassword(),
        },
      ),
    );
  }
}
