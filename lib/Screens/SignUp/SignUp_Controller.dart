import 'dart:developer';

import 'package:chat_app/Screens/SignUp/bloc/SignUp_bloc.dart';
import 'package:chat_app/User_Profile/User_Profile.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
class SignUpController{
  final BuildContext context;
  SignUpController({required this.context});
  final FirebaseAuth auth =FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  signUp()async{
    final state=context.read<SignUpBloc>().state;
    String email=state.email;
    String password=state.password;
    String confirmpassword=state.confirmpassword;
    if(email=="" && password=="" && confirmpassword==""){
      return UiHelper.CustomSnackBar("Enter Required Fields",);
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password)
            .then((value){
          firestore.collection("Users").doc(email).set({
          "Email":email,
          }).then((value){
          return Get.to(const UserProfile());
          });
        });
      }
      on FirebaseAuthException catch(ex){
        return log(ex.code.toString());
      }
    }
  }
}