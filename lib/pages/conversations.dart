import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/pages/messages.dart';
import 'package:seventh_sem_project/pages/tabs/navigations.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class ConversationApp extends StatelessWidget {
  const ConversationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          //removes the leading auto padding
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Opacity(
                opacity: 0.5,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search your chat',
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {},
                      )),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.0,
                                top: 15.0,
                              ),
                              child: Text(
                                "RECENTS UPDATE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),

                            //stories in the conversation page
                            Stories(
                              highLightColor: Colors.blue,
                              storyItemList: [
                                StoryItem(
                                    name: "First Story",
                                    thumbnail: const NetworkImage(
                                      "https://assets.materialup.com/uploads/82eae29e-33b7-4ff7-be10-df432402b2b6/preview",
                                    ),
                                    stories: [
                                      Scaffold(
                                        body: Container(
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  "https://wallpaperaccess.com/full/16568.png",
                                                ),
                                              )),
                                        ),
                                      ),
                                      // Second story in first group
                                      const Scaffold(
                                        body: Center(
                                          child: Text(
                                            "Second story in first group !",
                                            style: TextStyle(
                                              color: Color(0xff777777),
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                StoryItem(
                                  name: "2nd",
                                  thumbnail: const NetworkImage(
                                    "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                                  ),
                                  stories: [
                                    const Scaffold(
                                      body: Center(
                                        child: Text(
                                          "That's it, Folks !",
                                          style: TextStyle(
                                            color: Color(0xff777777),
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //messages i.e personal one to one messages
                ChatCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
