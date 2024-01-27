import 'dart:developer';

import 'package:chat_app/Screens/Login/bloc/login_bloc.dart';
import 'package:chat_app/Screens/Login/bloc/login_states.dart';
import 'package:chat_app/Screens/Login/login_Controller.dart';
import 'package:chat_app/Screens/SignUp/Signup_page.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_events.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white.withOpacity(.8),
            body: Center(
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
                    "Welcome back you've been missed!",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(.6)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UiHelper.CustomTextField( "Email", false, (value){
                    context.read<LoginBloc>().add(EmailEvents(email: value));
                    print(value);
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  UiHelper.CustomTextField( "Password", true, (value){
                    context.read<LoginBloc>().add(PasswordEvents(password: value));
                    print(value);
                  }),
                  SizedBox(height: 20),
                  UiHelper.CustomButton(() {
                    LoginController(context: context).login();
                  }, "Sign In"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a Member?",
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(.7)),
                      ),
                      TextButton(
                          onPressed: () {
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

                          },
                          child: Text(
                            "Register now",
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
          );
        }
      ),
    );
  }
}
