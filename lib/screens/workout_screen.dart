import 'package:flutter/material.dart';
import 'exercise_list_screen.dart'; // صفحة تمارين العضلة المختارة

class WorkoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> muscles = [
    {"name": "Chest", "image": "images/chest.png", "exercises": 37},
    {"name": "Back", "image": "images/back.png", "exercises": 25},
    {"name": "Biceps", "image": "images/biceps.png", "exercises": 24},
    {"name": "Forearms", "image": "images/forearms.png", "exercises": 4},
    {"name": "Abs", "image": "images/abs.png", "exercises": 28},
    {"name": "Calf", "image": "images/calf.png", "exercises": 9},
    {"name": "Legs", "image": "images/legs.png", "exercises": 36},
  ];

  WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercises", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: muscles.length,
        itemBuilder: (context, index) {
          final muscle = muscles[index];
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                ), // إضافة مسافات حول العنصر
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ), // لون خفيف للخلفية
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset(
                    muscle["image"],
                    width: 80, // ✅ تكبير عرض الصورة
                    height: 200, // ✅ تكبير طول الصورة
                    fit: BoxFit.fitWidth,
                    // ✅ لجعل الصورة تغطي المساحة بالكامل بدون تشويه
                  ),
                  title: Text(
                    muscle["name"],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                    child: Text(
                      "${muscle["exercises"]} exercises",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ExerciseListScreen(muscleName: muscle["name"]),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10), // مسافة بين كل تمرينة والتانية
            ],
          );
        },
      ),
    );
  }
}
