import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:passwordmanager/styles/themechanger.dart';
import 'package:passwordmanager/windows/spleash.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../Address/address_detail.dart';
import '../Address/add_address.dart';
import '../models/passw.dart';
import '../password/add_password.dart';
import '../password/pass_detail.dart';
import '../models/address.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AuthData()),
        ),
        ChangeNotifierProvider(
          create: ((context) => PasswordData()),
        ),
        ChangeNotifierProvider(
          create: ((context) => AddressDate()),
        ),
        ChangeNotifierProvider(
          create: ((context) => ThemeChanger()),
        ),
      ],
      child: Builder(builder: (context) {
        final _theme = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          darkTheme: ThemeData.dark().copyWith(
            buttonTheme: ButtonThemeData(),
            primaryColor: Colors.green,
          ),
          themeMode: _theme.tMode,
          home: SplashScreen(),
          // StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (BuildContext context, snapshot) {
          //     if (snapshot.hasData) {
          //       return MyHomePage();
          //     } else {
          //       return LogIn();
          //     }
          //   },
          //),
          routes: {
            AddressDetails.routeName: (context) => const AddressDetails(),
            PassPageDetails.routeName: (context) => const PassPageDetails(),
            AddAddress.routeName: (context) => const AddAddress(),
            AddPassword.routeName: (context) => const AddPassword(),
          },
        );
      }),
    );
  }
}
