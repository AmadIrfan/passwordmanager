import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/passw.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({super.key});
  static const routeName = '/addPassword';
  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _form = GlobalKey<FormState>();
  final webNode = FocusNode();
  final nameNode = FocusNode();
  final passNode = FocusNode();
  final btnNode = FocusNode();

  bool inIt = true;
  Password pass = Password(
    webSite: "",
    uName: "",
    id: null,
    password: "",
    addedDate: DateTime.now(),
  );
  List<Color> colorsGet=[
    Colors.green.shade100,
    Colors.green.shade200,
    Colors.green.shade400,
    Colors.green.shade600,
    Colors.grey.shade700,
    Colors.grey.shade500,
    Colors.grey.shade100,
  ];
  Color selectedColor=Colors.blue;
  var initVal = {
    "web": "",
    "uname": "",
    "pass": "",
  };
  @override
  void dispose() {
    webNode.dispose();
    btnNode.dispose();
    passNode.dispose();
    nameNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      final id = ModalRoute.of(context)!.settings.arguments;
      if (id != null) {
        pass = Provider.of<PasswordData>(context).findById(
          id.toString(),
        );
        initVal = {
          "web": pass.webSite!,
          "uname": pass.uName!,
          "pass": pass.password!,
        };
      }
    }
    inIt = false;
    super.didChangeDependencies();
  }

  save() {
    bool isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      if (pass.id != null) {
        Provider.of<PasswordData>(context, listen: false).upDate(
          pass.id,
          pass,
        );
      } else {
        Provider.of<PasswordData>(context, listen: false).addInList(pass);
        Navigator.pop(context, true);
      }
      Navigator.pop(context, true);
    }
  }

  @override
  void initState() {
    selectedColor=colorsGet[Random().nextInt(colorsGet.length)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: selectedColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.transparent ,
        elevation: 0,
        title: Text('Add Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.password),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: initVal["web"].toString(),
                        focusNode: webNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          label: const Text("web site"),
                        ),
                        keyboardType: TextInputType.url,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(nameNode);
                        },
                        validator: ((value) {
                          if (value != '') {
                            if (!value!.startsWith("http") ||
                                !value.endsWith(".com")) {
                              return "please enter a valid url";
                            }
                          }
                          else if(value==null){
                            return "please enter values ";
                          }
                          else {
                            return null;
                          }
                          return null;
                        }),
                        onSaved: (web) {
                          pass = Password(
                              webSite: web,
                              uName: pass.uName,
                              id: pass.id,
                              password: pass.password,
                              addedDate: pass.addedDate);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: initVal["uname"].toString(),
                        focusNode: nameNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          label: const Text("Name"),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(passNode);
                        },
                        onSaved: (name) {
                          pass = Password(
                              webSite: pass.webSite,
                              uName: name,
                              id: pass.id,
                              password: pass.password,
                              addedDate: pass.addedDate);
                        },
                        validator: (value){
                           if(value==""){
                          return "please enter values ";
                          }
                           else{
                             return null;
                           }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: initVal["pass"].toString(),
                        focusNode: passNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          label: const Text("Password"),
                        ),
                        validator: ((value) {
                          if (value != "") {
                            if (value!.length < 6) {
                              return 'Password must be at least 6 character';
                            }
                          }else if(value==""){
                            return "please enter values ";
                          }
                          else {
                            return null;
                          }
                          return null;
                        }),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(btnNode);
                        },
                        onSaved: (passw) {
                          pass = Password(
                              webSite: pass.webSite,
                              uName: pass.uName,
                              id: pass.id,
                              password: passw,
                              addedDate: pass.addedDate);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          focusNode: btnNode,
                          onPressed: () {
                            save();
                          },
                          child: Text('Save'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
