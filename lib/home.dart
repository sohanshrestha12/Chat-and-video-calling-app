import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/pages/CallPage.dart';
import 'package:seventh_sem_project/pages/auth/login.dart';
import 'package:seventh_sem_project/pages/auth/otp_phoneno_fillpage.dart';
import 'package:seventh_sem_project/pages/auth/otp_verify_page.dart';
import 'package:seventh_sem_project/pages/auth/signup.dart';
import 'package:seventh_sem_project/pages/conversations.dart';
import 'package:seventh_sem_project/pages/messages.dart';
import 'package:seventh_sem_project/pages/navigating_page.dart';
import 'package:seventh_sem_project/pages/personalMessage.dart';
import 'package:seventh_sem_project/pages/profile.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NavigatingPage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/profilepage': (context) => ProfilePage(),
        '/conversationpage': (context) => ConversationApp(),
        '/personalMessagePage': (context) => PersonalMessage(
              receivedUserID: 'default',
              receivedUserEmail: 'default',
              receivedUsername: 'default',
            ),
      },
    );
  }
}
