import 'package:chat_app/Screens/SignUp/Signup_page.dart';
import 'package:chat_app/Widget/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashController extends StatefulWidget {
  const SplashController({super.key});

  @override
  State<SplashController> createState() => _SplashController();
}

class _SplashController extends State<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        if(snapshot.hasData){
          return const HomeScreen();
        }
        else{
          return const SignUpPage();
        }
      }),
    );
  }
}