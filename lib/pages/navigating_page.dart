  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
  import 'package:seventh_sem_project/pages/CallPage.dart';
  import 'package:seventh_sem_project/pages/conversations.dart';
  import 'package:seventh_sem_project/pages/profile.dart';
  import 'package:seventh_sem_project/pages/GalleryPage.dart';
  import 'package:seventh_sem_project/pages/tabs/navigations.dart';

  class NavigatingPage extends StatefulWidget {
    NavigatingPage({super.key});

    @override
    State<NavigatingPage> createState() => _NavigatingPageState();
  }

  class _NavigatingPageState extends State<NavigatingPage> {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    
    
    //currentTab for changing the active navigation bar color
    int currentTab = 0;

    //screens for changing when navigation bar is pressed
    final List<Widget> screens = [
      ConversationApp(),
      CallsPage(),
      GalleryPage(),
      ProfilePage(),
    ];

    //updates the current tab
    void updateCurrentTab(int index) {
      setState(() {
        currentTab = index;
      });
    }

    //updates the current screen
    void updateCurrentScreen(int index) {
      setState(() {
        currentScreen = screens[index];
      });
    }

    // final PageStorageBucket bucket = PageStorageBucket();

    //sets the currentScreen based on nav tabs initially ConversationApp
    Widget currentScreen = ConversationApp();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // PageStorage->Creates a widget that provides a storage bucket for its descendants
        body: SingleChildScrollView(child: currentScreen),

        //floating Action buttons
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: CircleBorder(),
              elevation: 0,
            ),
          ),
        ),

        //bottom Navigation bar
        bottomNavigationBar: BottomNavbar(
            currentTab: currentTab,
            updateCurrentTab: updateCurrentTab,
            updateCurrentScreen: updateCurrentScreen,
        ),
      );
    }
  }
