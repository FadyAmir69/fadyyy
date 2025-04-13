// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fadyyy_new/components/custombuttonauth.dart';
import 'package:fadyyy_new/components/customlogoauth.dart';
import 'package:fadyyy_new/components/textformfield.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool isEmailSent = false;
  bool isUserCreated = false;

  void showErrorDialog(String message) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
      btnOkOnPress: () {},
      btnOkColor: Colors.red,
    ).show();
  }

  void showSuccessDialog(String message) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: message,
      btnOkOnPress: () {},
      btnOkColor: Colors.green,
    ).show();
  }

  Future<void> createUser() async {
    if (username.text.isEmpty || email.text.isEmpty || password.text.isEmpty) {
      showErrorDialog("Please fill in all fields.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );

      setState(() {
        isUserCreated = true;
      });

      showSuccessDialog("Account created! Now verify your email.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorDialog("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showErrorDialog("The account already exists for that email.");
      } else {
        showErrorDialog("Something went wrong. Please try again.");
      }
    } catch (e) {
      showErrorDialog("Unexpected error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        isEmailSent = true;
      });
      showSuccessDialog("Verification email sent. Please check your inbox.");
    } catch (e) {
      showErrorDialog("Failed to send verification email: $e");
    }
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      showSuccessDialog("Email verified! You can now use the app.");
      Navigator.of(context).pushReplacementNamed("homeScreen");
    } else {
      showErrorDialog("Email not verified yet. Please check your inbox.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const CustomLogoAuth(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account 📝",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Sign up and start your fitness journey",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                const Text(
                  "Username",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextForm(
                  hinttext: "Enter your username",
                  mycontroller: username,
                ),

                const SizedBox(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextForm(
                  hinttext: "Enter your email",
                  mycontroller: email,
                ),

                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextForm(
                  hinttext: "Enter your password",
                  mycontroller: password,
                  isPassword: true,
                ),

                const SizedBox(height: 20),
                if (isUserCreated)
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: sendVerificationEmail,
                        icon: const Icon(Icons.email),
                        label: const Text("Send Verification"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (isEmailSent)
                        const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),

                const SizedBox(height: 30),

                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        CustomButtonAuth(
                          title: "Create Account",
                          onPressed: createUser,
                        ),
                        const SizedBox(height: 10),
                        if (isEmailSent)
                          CustomButtonAuth(
                            title: "I Verified My Email",
                            onPressed: checkEmailVerified,
                          ),
                      ],
                    ),

                const SizedBox(height: 25),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("login");
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
