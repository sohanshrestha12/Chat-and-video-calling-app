import 'package:flutter/material.dart';

class DmMessages extends StatefulWidget {
  final List messages;
  const DmMessages({super.key, required this.messages});

  @override
  State<DmMessages> createState() => _DmMessagesState();
}

class _DmMessagesState extends State<DmMessages> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,

              itemCount: widget.messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(widget.messages[index]['Message'],style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),),
                      ),
                    ],
                  ),
                );
              }),
        )
    );
  }
}