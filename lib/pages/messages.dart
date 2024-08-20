import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/pages/personalMessage.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          return Column(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(DocumentSnapshot document, BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // print(_auth.currentUser);
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    print(data);

    if (data == null ||
        data['email'] == null ||
        data['uid'] == null ||
        data['username'] == null) {
      return Container();
    }

    if (data == null ||
        data['email'] == null ||
        data['uid'] == null ||
        data['username'] == null) {
      return Container();
    }
    //display all users except current user.
    if (_auth.currentUser!.email != data['email']) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/R.9f909e47ddfdd7ab255971b2575dcfb8?rik=8JdK90F8aI9J7Q&riu=http%3a%2f%2fwritestylesonline.com%2fwp-content%2fuploads%2f2016%2f08%2fFollow-These-Steps-for-a-Flawless-Professional-Profile-Picture-1024x1024.jpg&ehk=at%2bW8ahmVDAWSjLun4vkjMUmmlvUD7psBtJ5Bf9jSfA%3d&risl=&pid=ImgRaw&r=0"),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalMessage(
                              receivedUserEmail: data["email"],
                              receivedUserID: data["uid"],
                              receivedUsername: data["username"],
                            )),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['username'],
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 1.0),
                        Opacity(
                            opacity: 0.64,
                            child: Text("How are you?",
                                maxLines: 1, overflow: TextOverflow.ellipsis))
                      ],
                    ),
                  ),
                )),
            Opacity(opacity: 0.64, child: Text("4.01"))
          ],
        ),
      );
    } else {
      return Container();
    }
  }

}