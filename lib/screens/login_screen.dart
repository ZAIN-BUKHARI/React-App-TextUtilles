import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/widegts/custom_buttons.dart';

import '../resources/auth_methods.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);
  @override
  State<Loginscreen> createState() => _Loginscreen();
}

class _Loginscreen extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final AuthMethods _authMethods = AuthMethods();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Image.asset('assets/img/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/Hack');
              }
            },
          )
        ],
      ),
    );
  }
}
