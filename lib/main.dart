import 'package:chat_app/Screens/Login/login_page.dart';
import 'package:chat_app/Screens/SignUp/Signup_page.dart';
import 'package:chat_app/Splash/Splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'Screens/Login/bloc/login_bloc.dart';
import 'Screens/SignUp/bloc/SignUp_bloc.dart';
import 'User_Profile/User_Profile.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignUpBloc()),
        BlocProvider(create: (_) => LoginBloc())
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatty',
        home: UserProfileScreen(),
        //  }
       //   },
     //   ),
      ),
    );
  }
}