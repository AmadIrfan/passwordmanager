import 'package:flutter/material.dart';
import '../windows/login.dart';
import '../styles/properties.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const routeName = '/signup';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.portraitUp,
  //     // DeviceOrientation.portraitDown,
  //   ]);
  //   super.initState();
  // }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  final textFocus = FocusNode();
  final cPassFocus = FocusNode();
  final passFocus = FocusNode();
  final btnFocus = FocusNode();
  bool visibility = false;
  bool visibility1 = false;
  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                    child: ListView(
                      children: [
                        SizedBox(
                          height: mode ? size * 0.04 : size * 0.06,
                          child: TextFormField(
                            focusNode: textFocus,
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
                              FocusScope.of(context).requestFocus(passFocus);
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
                        OutlinedButton.icon(
                          focusNode: btnFocus,
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          label: Text(
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
