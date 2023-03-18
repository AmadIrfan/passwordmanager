import 'package:flutter/material.dart';

import 'package:passwordmanager/models/auth.dart';
import 'package:provider/provider.dart';
import '../windows/login.dart';
import '../styles/properties.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const routeName = '/signup';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final form = GlobalKey<FormState>();
  final emailFocus = FocusNode();
  final textFocus = FocusNode();
  final cPassFocus = FocusNode();
  final passFocus = FocusNode();
  final btnFocus = FocusNode();
  bool visibility = true;
  bool visibility1 = true;
  bool isLoading = false;
  Auth auth = Auth(
    name: "",
    email: "",
    password: "",
  );
  final _textEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passEditingController = TextEditingController();
  final _passCEditingController = TextEditingController();

  save() async {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<AuthData>(
          context,
          listen: false,
        ).signUp(auth);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              e.toString(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Okay"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          20.0,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent.withOpacity(0.5),
              Colors.amberAccent.withOpacity(0.5),
              Colors.blue.withOpacity(0.7),
              Colors.blueAccent.withOpacity(0.6),
              Colors.amberAccent.withOpacity(0.5),
              Colors.greenAccent.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: mode ? size * 0.04 : size * 0.2,
              ),
              Text(
                'SignUp',
                style: style,
              ),
              SizedBox(
                height: mode ? size * 0.04 : size * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: form,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.06,
                          child: TextFormField(
                            controller: _textEditingController,
                            focusNode: textFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              label: Text(
                                " User Name",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(emailFocus);
                            },
                            onSaved: (newValue) {
                              auth = Auth(
                                name: newValue!,
                                email: auth.email,
                                password: auth.password,
                              );
                            },
                            validator: (value) {
                              return;
                            },
                          ),
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.01,
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.06,
                          child: TextFormField(
                            focusNode: emailFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              label: Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus();
                            },
                            controller: _emailEditingController,
                            onSaved: (newValue) {
                              auth = Auth(
                                name: auth.name,
                                email: newValue!,
                                password: auth.password,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.01,
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.06,
                          child: TextFormField(
                            focusNode: passFocus,
                            textInputAction: TextInputAction.next,
                            obscureText: visibility ? true : false,
                            decoration: InputDecoration(
                              suffix: IconButton(
                                onPressed: () {
                                  visibility = !visibility;
                                  setState(() {});
                                },
                                icon: Icon(
                                  visibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(cPassFocus);
                            },
                            controller: _passEditingController,
                            onSaved: (newValue) {
                              auth = Auth(
                                email: auth.email,
                                name: auth.name,
                                password: newValue!,
                              );
                            },
                            validator: (value) {
                              if (value.toString() == "") {
                                return "field is empty";
                              } else if (_passCEditingController.text !=
                                  value) {
                                return "Password must be same";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.01,
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.06,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: visibility1 ? true : false,
                            decoration: InputDecoration(
                              suffix: IconButton(
                                onPressed: () {
                                  visibility1 = !visibility1;
                                  setState(() {});
                                },
                                icon: Icon(
                                  visibility1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              label: Text(
                                'Confirm Password',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            focusNode: cPassFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(btnFocus);
                            },
                            controller: _passCEditingController,
                            onSaved: (newValue) {},
                            validator: (value) {
                              if (value.toString() == "") {
                                return "field is empty";
                              } else if (value != _passEditingController.text) {
                                return "Password must be same";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account ?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => LogIn()),
                                  ),
                                );
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.01,
                        ),
                        OutlinedButton(
                          focusNode: btnFocus,
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            save();
                          },
                          child: isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
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
