import 'package:chat_app/Pages/Signup_page.dart';
import 'package:chat_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              UiHelper.CustomTextField(emailController, "Email", false),
              SizedBox(
                height: 10,
              ),
              UiHelper.CustomTextField(passwordController, "Password", true),
              SizedBox(height: 20),
              UiHelper.CustomButton(() {

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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
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
      ),
    );
  }
}
