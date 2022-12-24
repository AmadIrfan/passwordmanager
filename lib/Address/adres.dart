import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter/services.dart';
import 'package:passwordmanager/Address/address_detail.dart';
import 'package:passwordmanager/widgets/aadr_line_bulder.dart';
import 'package:provider/provider.dart';

import '../Address/add_address.dart';
import '../models/address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final listItems = Provider.of<AddressDate>(context).itemsList;

    return Scaffold(
      body: listItems.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Your Added Data will be Show Hare."),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: listItems
                    .map(
                      (e) => Slidable(
                        startActionPane: ActionPane(
                          children: [
                            SlidableAction(
                              onPressed: ((context) {
                                showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        title: Text("Warning "),
                                        content: Text(
                                            "Are You sure you want to delete entery ??? "),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              child: Text('No')),
                                          TextButton(
                                              onPressed: () {
                                                Provider.of<AddressDate>(
                                                        context,
                                                        listen: false)
                                                    .deleteAdr(
                                                  e.id!,
                                                );
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
                                Navigator.of(context).pushNamed(
                                  AddAddress.routeName,
                                  arguments: e.id!,
                                );
                              }),
                              icon: Icons.edit,
                              label: "Edit",
                            ),
                          ],
                          motion: DrawerMotion(),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AddressDetails.routeName,
                              arguments: e.id,
                            );
                          },
                          child: LineBuilder(
                            e: e,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 10,
            backgroundColor: Colors.white,
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
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, AddAddress.routeName);
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add Address'),
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
