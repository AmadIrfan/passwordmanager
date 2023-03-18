import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../models/passw.dart';
import '../password/add_password.dart';

class PassPageDetails extends StatefulWidget {
  const PassPageDetails({super.key});
  static const routeName = '/newPagePassword';

  @override
  State<PassPageDetails> createState() => _PassPageDetailsState();
}

class _PassPageDetailsState extends State<PassPageDetails> {
  bool visibility = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final routData = ModalRoute.of(context)!.settings.arguments as String?;
    final listData = Provider.of<PasswordData>(context).passItem;
    final data = listData.firstWhere(
      (element) => element.id == routData,
    );
    nameController.text = data.uName!;
    webController.text = data.webSite!;
    passController.text = data.password!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //     backgroundColor: Colors.transparent,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: AddPassword(),
                      type: PageTransitionType.rightToLeft,
                      settings: RouteSettings(
                        arguments: data.id,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ],
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                top: 140,
                left: 150,
                right: 150,
                bottom: 50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(9, 8),
                  ),
                ],
              ),
              // color: Colors.white,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 150,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        readOnly: true,
                        controller: webController,
                        decoration: InputDecoration(
                          label: Text('Web Site'),
                        ),
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromSize(
                              Rect.fromCenter(
                                  center: Offset.zero, width: 100, height: 100),
                              Size(100, 100),
                            ),
                            items: [
                              PopupMenuItem(
                                child: TextButton.icon(
                                  label: Text(
                                    'copy',
                                  ),
                                  onPressed: () {
                                    final value =
                                        ClipboardData(text: data.webSite);
                                    Clipboard.setData(value);
                                    Navigator.of(context).pop(true);
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromSize(
                              Rect.fromCenter(
                                  center: Offset.zero, width: 100, height: 100),
                              Size(100, 100),
                            ),
                            items: [
                              PopupMenuItem(
                                child: TextButton.icon(
                                  label: Text(
                                    'copy',
                                  ),
                                  onPressed: () {
                                    final value =
                                        ClipboardData(text: data.uName);
                                    Clipboard.setData(value);
                                    Navigator.of(context).pop(true);
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        readOnly: true,
                        controller: nameController,
                        decoration: InputDecoration(
                          label: Text('Name'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: visibility ? true : false,
                        readOnly: true,
                        controller: passController,
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromSize(
                              Rect.fromCenter(
                                  center: Offset.zero, width: 100, height: 100),
                              Size(100, 100),
                            ),
                            items: [
                              PopupMenuItem(
                                child: TextButton.icon(
                                  label: Text(
                                    'copy',
                                  ),
                                  onPressed: () {
                                    final value =
                                        ClipboardData(text: data.password);
                                    Clipboard.setData(value);
                                    Navigator.of(context).pop(true);
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {});
                              visibility = !visibility;
                            },
                            icon: visibility
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
