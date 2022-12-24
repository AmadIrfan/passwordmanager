import 'package:flutter/material.dart';
import 'package:passwordmanager/windows/drawer.dart';
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
    return Scaffold(
      drawer: const Drawer(
        child: Drawers(),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Password Manager',
        ),
      ),
      body: pages[_itemCounter]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _itemCounter,
        backgroundColor: Theme.of(context).primaryColor,
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
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.wysiwyg_sharp,
            ),
            label: pages[2]['title'].toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            label: pages[3]['title'].toString(),
          ),
        ],
      ),
    );
  }
}
//  Column(
        // children: [
          // Card(
          //   elevation: 3,
          //   margin: const EdgeInsets.all(0),
          //   child: Container(
          //     alignment: Alignment.centerLeft,
          //     width: double.infinity,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           Colors.greenAccent.withOpacity(0.5),
          //           Colors.amberAccent.withOpacity(0.5),
          //           Colors.blue.withOpacity(0.7),
          //           Colors.blueAccent.withOpacity(0.6),
          //           Colors.amberAccent.withOpacity(0.5),
          //           Colors.greenAccent.withOpacity(0.5),
          //         ],
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //       ),
          //     ),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.menu,
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 3,
          //         ),
          //         const Text(
          //           'Password Manager',
          //           style: styleAppBar,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),