import 'package:chat_app/Pages/login_page.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                UiHelper.CustomTextField(emailController, "Email", false),
                SizedBox(
                  height: 10,
                ),
                UiHelper.CustomTextField(passwordController, "Password", true),
                SizedBox(
                  height: 10,
                ),
                UiHelper.CustomTextField(confirmPasswordController, "Confirm Password", true),
                SizedBox(height: 20),
                UiHelper.CustomButton(() {

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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
      ),
    );
  }
}