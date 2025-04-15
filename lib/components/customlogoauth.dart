import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ بعرض الشاشة بالكامل
      height: 200, // ✅ ارتفاع مناسب
      child: Image.asset(
        "assets/images/loginP/loginPhoto.png",
        fit: BoxFit.cover, // ✅ تغطي العرض وتقص الزايد من الصورة لو في
      ),
    );
  }
}
