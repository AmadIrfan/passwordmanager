import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../password/add_password.dart';
import '../models/passw.dart';
import '../widgets/passDatabuilder.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool delete = false;
  bool selectItemDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: Provider.of<PasswordData>(context, listen: false).fatchDataDB(),
        builder: (context, snapshot) =>
            Consumer<PasswordData>(builder: (context, listData, child) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : listData.passItem.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.password,
                            size: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Password info you add will show hare."),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: listData.passItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChangeNotifierProvider.value(
                            value: listData.passItem[index],
                            child: PAssBuilder());
                      },
                    );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: ((context) => GestureDetector(
                  onTap: () {},
                  child: SingleChildScrollView(
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: AddPassword(),
                                  type: PageTransitionType.fade,
                                  // alignment: Alignment.center,
                                  // duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                            label: Text('Add Password'),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((context) => Container(
                                      width: double.infinity,
                                      height: 300,
                                    )),
                              );
                            },
                            icon: Icon(Icons.text_increase),
                            label: Text("Generate Password"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
