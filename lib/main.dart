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

// الكلاس الرئيسي للتطبيق
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء علامة "Debug"
      title: "Fitness App", // اسم التطبيق
      initialRoute: "/", // الصفحة اللي هتفتح مع تشغيل التطبيق
      routes: {
        "/": (context) => HomeScreen(), // الصفحة الرئيسية  ~~
        "/workout": (context) => WorkoutScreen(), // صفحة التمارين
        "/diet_plan": (context) => DietPlanScreen(), // صفحة النظام الغذائي
      },
    );
  }
} 
