import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/components/my_button.dart';
import 'package:seventh_sem_project/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seventh_sem_project/pages/auth/login.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> signup() async {
    var email = _emailController.text;
    var username = usernameController.text;
    try{
      UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email':email,
        'username': username,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()),);

    }catch(e){
      print("Error while signup: $e");
    }
  }

  Future<void> gotoLogin() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 120.0),
                  Text("Let's Register Account",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5.0),
                  Text(
                    "Hello user, you will have a grateful journey",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 30.0),
                  MyTextField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  MyTextField(
                    controller: _emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(onPressed: signup, child: Text("Sign Up")),
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
                      Text("Already have an account?",
                          style: TextStyle(color: Colors.grey[800])),
                      GestureDetector(
                        onTap: gotoLogin,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            "Sign in",
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
        ));
  }
}
