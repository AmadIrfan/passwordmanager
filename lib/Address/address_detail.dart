import 'package:flutter/material.dart';
import 'package:passwordmanager/models/address.dart';
import 'package:provider/provider.dart';

class AddressDetails extends StatefulWidget {
  static const routeName = "/address_details";
  const AddressDetails({super.key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String;
    final itemData =
        Provider.of<AddressDate>(context, listen: false).findById(data);
    print(itemData.name);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.name,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Name'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.phone,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Phone'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.email,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Email'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.country,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Country'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.street_Address,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Street'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.city,
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('City'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: itemData.orgnization,
                        readOnly: true,
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        decoration: InputDecoration(
                          label: Text('Orgnization'),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: itemData.street_Address,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Street'),
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
                                  onPressed: () {},
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
                      TextFormField(
                        initialValue: itemData.postalCode,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Postal Code'),
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.copy,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
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
