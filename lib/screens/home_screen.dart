import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // لون الخلفية الفاتح
      appBar: AppBar(
        title: Text("Fitness App 🏋️‍♂️" , style: TextStyle(color: Colors.white  , fontSize: 25 ) ), // عنوان احترافي مع أيقونة
        centerTitle: true, // جعل العنوان في المنتصف
        backgroundColor: Colors.blue[400], // لون شريط العنوان
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
          children: [
            // صورة ترحيبية في الأعلى
            CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage(
                "images/logo2.jpg",
              ), // ضع صورة احترافية هنا
            ),
            SizedBox(height: 150), // مسافة بين العناصر

            Text(
              "Welcome To a Healthier life!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose an option to start your journey",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),

            // زر التمارين
            ElevatedButton.icon(
              icon: Icon(Icons.fitness_center, color: Colors.white),
              label: Text(
                "Workout Guide",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/workout");
              },
            ),
            SizedBox(height: 15),

            // زر النظام الغذائي
            ElevatedButton.icon(
              icon: Icon(Icons.restaurant_menu, color: Colors.white),
              label: Text(
                "Diet Plan",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 105),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/diet_plan");
              },
            ),
          ],
        ),
      ),
    );
  }
}