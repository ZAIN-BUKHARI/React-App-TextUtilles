import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';

import '../widegts/custom_buttons.dart';

class Setting extends StatelessWidget {
  final AuthMethods _auth =AuthMethods();
  Setting({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(height: 150,width: 150,child: CircleAvatar(backgroundImage: NetworkImage(_auth.user.photoURL.toString(),),)),
            CustomButton(text: 'Logout', onPressed: ()=>AuthMethods().logout(context))
          ],
        ),
      ),
    );
  }
}