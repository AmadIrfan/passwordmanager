import 'package:flutter/material.dart';

import 'package:passwordmanager/Account/account.dart';
import 'package:passwordmanager/Account/user_profile.dart';

import '../styles/style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _itemCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/l.jpg",
          ),
          fit: BoxFit.cover,
          opacity: 1.0,
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
          child: Accounts(),
        ),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,

          //    backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Password Manager',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: ((context) => UserProfilePage())),
                  );
                },
                icon: Icon(Icons.next_plan))
          ],
        ),
        body: pages[_itemCounter]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _itemCounter,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          onTap: (value) => setState(() {
            _itemCounter = value;
          }),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.key,
              ),
              label: pages[0]['title'].toString(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.location_on_outlined,
              ),
              label: pages[1]['title'].toString(),
            ),
          ],
        ),
      ),
    );
  }
}
