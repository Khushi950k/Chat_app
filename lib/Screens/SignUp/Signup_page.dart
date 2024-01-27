import 'dart:developer';

import 'package:chat_app/Screens/Login/login_page.dart';
import 'package:chat_app/Screens/SignUp/SignUp_Controller.dart';
import 'package:chat_app/Screens/SignUp/bloc/SignUp_bloc.dart';
import 'package:chat_app/Screens/SignUp/bloc/SignUp_events.dart';
import 'package:chat_app/Screens/SignUp/bloc/SignUp_states.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SignUpBloc,SignUpStates>(
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.white.withOpacity(.8),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      size: 90,
                      color: Colors.black.withOpacity(.7),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Let's create an account for you!",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    UiHelper.CustomTextField( "Email", false, (value){
                      context.read<SignUpBloc>().add(EmailEvents(email: value));
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    UiHelper.CustomTextField( "Password", false, (value){
                      context.read<SignUpBloc>().add(PasswordEvents(password: value));
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    UiHelper.CustomTextField("Confirm Password", false,(value){
                      context.read<SignUpBloc>().add(ConfirmPasswordEvents(confirmpassword: value));
                    }),
                    SizedBox(height: 20),
                    UiHelper.CustomButton(() {
                     SignUpController(context: context).signUp();
                     }, "Sign Up"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a Member?",
                          style: TextStyle(
                              fontSize: 16, color: Colors.black.withOpacity(.7)),
                        ),
                        TextButton(
                            onPressed: () {
                              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                              Get.to(LoginPage());
                            },
                            child: Text(
                              "Login now",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}