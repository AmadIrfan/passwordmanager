import 'package:flutter/material.dart';

import '../password/forgetpassword.dart';
import '../windows/home_page.dart';
import '../styles/properties.dart';
import 'signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  static const routeName = '/login';
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     // DeviceOrientation.portraitDown,
  //   ]);
  //   super.initState();
  // }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  bool _visibility = true;
  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final btnFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
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
            children: [
              SizedBox(
                height: mode ? size * 0.05 : size * 0.2,
              ),
              Text(
                'Log In',
                style: style,
              ),
              SizedBox(
                height: mode ? size * 0.01 : size * 0.02,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: mode ? size * 1 : size * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      child: ListView(
                        children: [
                          SizedBox(
                            // width: mode ? wSize * 0.012 : wSize * 1,
                            height: mode ? size * 0.12 : size * 0.06,
                            child: TextFormField(
                              focusNode: emailFocus,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                iconColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  gapPadding: 0.0,
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                label: Text(
                                  'Email',
                                  style: textStyle,
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(passFocus);
                              },
                            ),
                          ),
                          SizedBox(
                            height: mode ? size * 0.04 : size * 0.04,
                          ),
                          SizedBox(
                            height: mode ? size * 0.12 : size * 0.06,
                            child: TextFormField(
                              focusNode: passFocus,
                              textInputAction: TextInputAction.done,
                              obscureText: _visibility,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                label: Text(
                                  'Password',
                                  style: textStyle,
                                ),
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _visibility = !_visibility;
                                    });
                                  },
                                  icon: Icon(
                                      _visibility
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white),
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(btnFocus);
                              },
                            ),
                          ),
                          SizedBox(
                            height: mode ? size * 0.02 : size * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'have an account ???',
                                style: textStyle,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => SignUp()),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mode ? size * 0.01 : size * 0.001,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Forget password ???',
                                style: textStyle,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => ForGetPassword()),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Reset Password',
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mode ? size * 0.00 : size * 0.04,
                          ),
                          OutlinedButton.icon(
                            focusNode: btnFocus,
                            style: OutlinedButton.styleFrom(
                                shape: StadiumBorder()),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: ((context) => MyHomePage()),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            label: Text(
                              "LOG IN",
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
      ),
    );
  }
}
