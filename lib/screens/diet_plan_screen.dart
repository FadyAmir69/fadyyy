import 'package:flutter/material.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key}); 

  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController bodyFatController = TextEditingController();
  String? selectedGoal;
  List<String> goals = ["Weight Loss", "Muscle Gain", "Maintain Weight"];

  void submitData() {
    try {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double bodyFat = double.parse(bodyFatController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Weight: $weight kg\nHeight: $height cm\nBody Fat: $bodyFat%\nGoal: $selectedGoal"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid numbers")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Your Details"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Weight (kg)"),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Height (cm)"),
              ),
              TextField(
                controller: bodyFatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Body Fat (%)"),
              ),
              SizedBox(height: 20),
              Text("Select Your Goal:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: selectedGoal,
                hint: Text("Choose Goal"),
                onChanged: (value) {
                  setState(() {
                    selectedGoal = value!;
                  });
                },
                items: goals.map((goal) {
                  return DropdownMenuItem(
                    value: goal,
                    child: Text(goal),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: submitData,
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
