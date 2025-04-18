import 'package:fadyyy_new/auth/login.dart';
import 'package:fadyyy_new/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fadyyy_new/screens/home_screen.dart'; // استيراد الصفحة الرئيسية
import 'package:fadyyy_new/screens/workout_screen.dart'; // استيراد صفحة التمارين
import 'package:fadyyy_new/screens/diet_plan_screen.dart'; // استيراد صفحة النظام الغذائي

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء علامة "Debug"
      home:
          FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified
              ? HomeScreen()
              : Login(),
      routes: {
        "Register": (context) => SignUp(),
        "login": (context) => Login(),
        "homeScreen": (context) => HomeScreen(),
        "workout": (context) => WorkoutScreen(),
        "diet_plan": (context) => DietPlanScreen(),
      },
    );
  }
}
