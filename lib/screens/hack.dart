import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';

class Google extends StatelessWidget {
  const Google({super.key});

  @override
  Widget build(BuildContext context) {
    // Static String routerName='/Google';
    final key = MediaQuery.of(context).viewInsets.bottom != 0;
    final TextEditingController password = TextEditingController();
    final AuthMethods current = AuthMethods();
    final data = current.user.email;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment:MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Google',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Welcome',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_2_rounded, color: Colors.grey),
                  Text(
                    '$data',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                       Padding(
                padding: const EdgeInsets.only(left: 100),
                child: key?ElevatedButton(
                  onPressed: () => current.savepassoerd(password.text, context),
                  child: Text('Next'),
                ):Text('hello',style: TextStyle(color: Colors.black),)
              ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 170),
              //   child: Text(
              //     'Forgot password?',
              //     style: TextStyle(color: Colors.blueAccent),
              //   ),
              // ),
              SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: ElevatedButton(
                  onPressed: () => current.savepassoerd(password.text, context),
                  child: Text('Next'),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
