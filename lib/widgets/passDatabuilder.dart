import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../models/passw.dart';
import '../password/add_password.dart';

import '../password/pass_detail.dart';

class PAssBuilder extends StatefulWidget {
  const PAssBuilder({super.key});

  @override
  State<PAssBuilder> createState() => _PAssBuilderState();
}

class _PAssBuilderState extends State<PAssBuilder> {
  @override
  Widget build(BuildContext context) {
    final e = Provider.of<Password>(context);
    final item = Provider.of<PasswordData>(context);
    ActionPane acp = ActionPane(
      children: [
        SlidableAction(
          onPressed: ((context) {
            showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: Text("Warning "),
                    content:
                        Text("Are You sure you want to delete entery ??? "),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () {
                            Provider.of<PasswordData>(context, listen: false)
                                .deletePass(e.id!);
                            Navigator.pop(context, true);
                          },
                          child: Text('Yes')),
                    ],
                  )),
            );
          }),
          icon: Icons.delete,
          label: "Delete",
        ),
        SlidableAction(
          onPressed: ((context) {
            Navigator.of(context)
                .pushNamed(AddPassword.routeName, arguments: e.id);
          }),
          icon: Icons.edit,
          label: "Edit",
        ),
      ],
      motion: DrawerMotion(),
    );
    return Column(
      children: [
        Slidable(
          endActionPane: acp,
          startActionPane: acp,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, PassPageDetails.routeName,
                  arguments: e.id!);
            },
            leading: CircleAvatar(
              child: Text(
                item.getChar(e.uName!),
              ),
            ),
            title: Text(e.webSite!),
            subtitle: Text(
              DateFormat.yMMMMEEEEd().format(e.addedDate!),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
