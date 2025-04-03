import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  final String muscleName;

  ExerciseListScreen({super.key, required this.muscleName});

  final Map<String, List<Map<String, String>>> exercises = {
    "Abs": [
      {"name": "Crunches", "image": "images/abs.png"},
      {"name": "Leg Raises", "image": "images/abs.png"},
    ],
    "Back": [
      {"name": "Pull Ups", "image": "images/abs.png"},
      {"name": "Deadlift", "image": "images/abs.png"},
    ],
    // باقي التمارين لكل عضلة...
  };

  @override
  Widget build(BuildContext context) {
    final muscleExercises = exercises[muscleName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("$muscleName Exercises"),
        backgroundColor: Colors.orange.shade400,
      ),
      body: ListView.builder(
        itemCount: muscleExercises.length,
        itemBuilder: (context, index) {
          final exercise = muscleExercises[index];
          return ListTile(
            leading: Image.asset(exercise["image"]!, width: 50, height: 50),
            title: Text(
              exercise["name"]!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
