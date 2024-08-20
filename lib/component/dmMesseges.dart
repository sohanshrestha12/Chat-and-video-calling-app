import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seventh_sem_project/model/messages.dart';

class DmMessages extends StatelessWidget {
<<<<<<< HEAD
  DmMessages({super.key});
=======
   DmMessages({super.key});
>>>>>>> 603b4782b7bf80056cc482da445c1dea686b6f98

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId,String message) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: (currentUserId),
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        timestamp: timestamp,
        message: message
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId,String otherUserId){
    List<String> ids = [userId,otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp',descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('message'),
    );

  }
//   return Expanded(
//       child: Container(
//         padding: EdgeInsets.all(20),
//          child: ListView.builder(
//         scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           reverse: true,
//
//           itemCount: widget.messages.length,
//           itemBuilder: (BuildContext context, int index) {
//           int reverseIndex = widget.messages.length - 1 - index;
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 1),
//
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                     child:
//                     Text(widget.messages[reverseIndex]['Message'],style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white,
//                     ),),
//                   ),
//                 ],
//               ),
//             );
//           }),
//   )
//   );
// }
}
