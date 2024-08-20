import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/pages/conversations.dart';

class BottomNavbar extends StatefulWidget {
  final int currentTab;
  final Function updateCurrentTab;
  final Function updateCurrentScreen;

  BottomNavbar(
      {super.key,
      required this.currentTab,
      required this.updateCurrentTab,
      required this.updateCurrentScreen});
  @override
  State<BottomNavbar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    widget.updateCurrentTab(0);
                    widget.updateCurrentScreen(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wechat_outlined,
                        color:
                            widget.currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                          color: widget.currentTab == 0
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    widget.updateCurrentTab(1);
                    widget.updateCurrentScreen(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        color:
                            widget.currentTab == 1 ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(
                          color: widget.currentTab == 1
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    widget.updateCurrentTab(2);
                    widget.updateCurrentScreen(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo,
                        color:
                            widget.currentTab == 2 ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: widget.currentTab == 2
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    widget.updateCurrentScreen(3);
                    widget.updateCurrentTab(3);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outlined,
                        color:
                            widget.currentTab == 3 ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: widget.currentTab == 3
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
