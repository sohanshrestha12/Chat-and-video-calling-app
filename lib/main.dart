
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/firebase_options.dart';
import 'package:seventh_sem_project/home.dart';
import 'package:seventh_sem_project/pages/auth/login.dart';
import 'package:seventh_sem_project/pages/auth/signup.dart';
import 'package:seventh_sem_project/pages/conversations.dart';
import 'package:seventh_sem_project/pages/navigating_page.dart';
import 'package:seventh_sem_project/pages/personalMessage.dart';
import 'package:seventh_sem_project/pages/profile.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform
 );
 runApp(MyApp());
}





