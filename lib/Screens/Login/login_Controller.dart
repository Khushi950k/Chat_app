import 'package:chat_app/Screens/Login/bloc/login_bloc.dart';
import 'package:chat_app/Widget/Home_Screen.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginController {
  final BuildContext context;
  LoginController({required this.context});
  final FirebaseAuth auth =FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  login() async {
    final state = context.read<LoginBloc>().state;
    String email = state.email;
    String password = state.password;

    if (email == "" && password == "") {
      return UiHelper.CustomSnackBar("Enter Required Fields",);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
              return Get.to(HomeScreen());
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomSnackBar(ex.code.toString(),);
      }
    }
  }
}