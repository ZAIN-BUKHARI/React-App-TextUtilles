import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/screens/hack.dart';
import 'package:flutter_zoom_clone/screens/home_screem.dart';
import 'package:flutter_zoom_clone/screens/join_meet.dart';
import 'package:flutter_zoom_clone/screens/login_screen.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
// Get Your Own SHA-1 Key: keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
// google login
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zoom clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        routes: {
          '/Login': (context) => const Loginscreen(),
          '/Home': (context) => const Homescreen(),
          '/Join': (context) => const JoinMeet(),
          '/Hack': (context) => const Google(),
        },
        home: StreamBuilder(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return const Homescreen();
            }
            return Loginscreen();
          },
        )
        );
  }
}
