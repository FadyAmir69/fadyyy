import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'exercise_detail_screen.dart';

class ExerciseListScreen extends StatefulWidget {
  final String muscleName;

  ExerciseListScreen({required this.muscleName});

  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  List<Map<String, dynamic>> exercises = [];

  Future<void> loadExercises() async {
    try {
      final String jsonData = await rootBundle.loadString('assets/data/exercises.json');
      final Map<String, dynamic> data = json.decode(jsonData);

      setState(() {
        exercises = List<Map<String, dynamic>>.from(data[widget.muscleName] ?? []);
      });
    } catch (e) {
      print("Error loading exercises: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.muscleName),
        backgroundColor: Colors.blue[400],
      ),
      body: exercises.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.all(10),
              itemCount: exercises.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseDetailScreen(
                          name: exercise["name"],
                          images: List<String>.from(exercise["images"]),
                          description: exercise["description"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.asset(
                        exercise["images"][0], // ✅ أول صورة من اللستة
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        exercise["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
