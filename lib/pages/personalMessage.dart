import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seventh_sem_project/component/Textfield.dart';
import 'package:seventh_sem_project/component/chat_bubble.dart';
import 'package:seventh_sem_project/component/dmMesseges.dart';
import 'package:seventh_sem_project/components/my_textfield.dart';

class PersonalMessage extends StatefulWidget {
  final String receivedUserEmail;
  final String receivedUserID;
  final String receivedUsername;

  const PersonalMessage({
    Key? key,
    required this.receivedUserEmail,
    required this.receivedUserID,
    required this.receivedUsername,
  }) : super(key: key);

  @override
  _PersonalMessageState createState() => _PersonalMessageState();
}

class _PersonalMessageState extends State<PersonalMessage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DmMessages _dmMessages = DmMessages();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _dmMessages.sendMessage(
        widget.receivedUserID,
        _messageController.text,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Comment out the content of the build method
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.9f909e47ddfdd7ab255971b2575dcfb8?rik=8JdK90F8aI9J7Q&riu=http%3a%2f%2fwritestylesonline.com%2fwp-content%2fuploads%2f2016%2f08%2fFollow-These-Steps-for-a-Flawless-Professional-Profile-Picture-1024x1024.jpg&ehk=at%2bW8ahmVDAWSjLun4vkjMUmmlvUD7psBtJ5Bf9jSfA%3d&risl=&pid=ImgRaw&r=0"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.receivedUsername,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Spacer(),
              Icon(
                Icons.video_camera_back_rounded,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.call,
                size: 30,
              ),
            ],
          ),
        ),

      ),
      body:Column(
        children: [

        Expanded(
          child: _buildMessageList(),
        ),

        _buildMessageInput(),
        ]
      ),
    );
  }

  Widget _buildMessageList(){
    return StreamBuilder(stream: _dmMessages.getMessages(widget.receivedUserID, _firebaseAuth.currentUser!.uid),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text('Error${snapshot.error}');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading...');
          }

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document)
                ).toList(),
          );
        }
    );
  }


  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String,dynamic> data = document.data() as Map<String,dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
     ?Alignment.centerRight:Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid) ? CrossAxisAlignment.end:CrossAxisAlignment.start ,
          mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid) ? MainAxisAlignment.end:MainAxisAlignment.start ,
          children: [
            // Text(data['senderEmail']),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(child: MyTextField(
          controller: _messageController,
          hintText: 'Enter message',
          obscureText: false,
        )),
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.send,size: 40,))
      ],
    );
  }
}
