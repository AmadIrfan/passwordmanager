import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../windows/login.dart';
import '../styles/properties.dart';

class ForGetPassword extends StatefulWidget {
  const ForGetPassword({super.key});

  static const routeName = '/forgetpass';
  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  bool loading = false;
  final emailFocus = FocusNode();
  final btnlFocus = FocusNode();
  final emailController = TextEditingController();
  final _form = GlobalKey<FormState>();
  onSave() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      bool valid = _form.currentState!.validate();
      if (valid) {
        setState(() {
          loading = true;
        });
        await _auth.sendPasswordResetEmail(email: emailController.text);
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text('Error'),
              content: Text(
                e.toString(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("okey"),
                ),
              ],
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: size * 1,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: mode ? size * 0.1 : size * 0.05,
                    ),
                    Text(
                      'Reset Password',
                      style: style,
                    ),
                    SizedBox(
                      height: mode ? size * 0.1 : size * 0.01,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _form,
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: mode ? size * 0.1 : size * 0.05,
                                  child: TextFormField(
                                    controller: emailController,
                                    focusNode: emailFocus,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                      ),
                                      border: OutlineInputBorder(
                                        gapPadding: 0.0,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      label: Text(
                                        'Email',
                                        style: textStyle,
                                      ),
                                    ),
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context).requestFocus(
                                        btnlFocus,
                                      );
                                    },
                                    validator: (value) {
                                      if (!value!.endsWith(".com") ||
                                          !value.contains("@")) {
                                        return "please enter valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: mode ? size * 0.1 : size * 0.019,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' Go to Login page ',
                                      style: textStyle,
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
                                        'Login',
                                        style: textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: mode ? size * 0.1 : size * 0.018,
                                ),
                                OutlinedButton(
                                  focusNode: btnlFocus,
                                  style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder()),
                                  onPressed: () {
                                    onSave();
                                  },
                                  child: loading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          "Send",
                                          style: textStyle,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
