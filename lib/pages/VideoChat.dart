import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.callID,required this.receivedUserEmail,
  });
  final String callID;
  final String receivedUserEmail;


  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 930243456, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "ecfad929feb2f60b3ff206430120684a7f25419968ff147f3235617328203450", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: receivedUserEmail,
      userName: receivedUserEmail,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
    );
  }
}