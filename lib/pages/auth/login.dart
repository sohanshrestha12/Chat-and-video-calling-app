import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/components/my_button.dart';
import 'package:seventh_sem_project/components/my_textfield.dart';
import 'package:seventh_sem_project/pages/auth/signup.dart';
import 'package:seventh_sem_project/pages/conversations.dart';
import 'package:seventh_sem_project/pages/navigating_page.dart';
import 'package:stories_for_flutter/full_page_view.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
  var email = _emailController.text;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email':email,
      },SetOptions(merge: true));

      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigatingPage()),);
    } catch (e) {

      print("Error while login: $e");
    }
  }

  Future<void> gotoSignup() async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupPage()),);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120.0),
                  Text(
                    "Welcome back!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Please enter your details to get started",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 15.0),
                  MyTextField(
                    controller: _emailController,
                    hintText: "Email or Phone Number",
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue[600]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(onPressed: login, child: Text("Sign In")),
                  SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Or'),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create an account?",
                          style: TextStyle(color: Colors.grey[800])),
                      GestureDetector(
                        onTap: gotoSignup,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}

