import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  final Function sendMessage;
  const CustomTextField({super.key,required this.sendMessage});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
                hintText: 'Type Something...',
                prefixIcon: IconButton(
                  icon: Icon(Icons.emoji_emotions),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    print(_controller.text);
                    widget.sendMessage(_controller.text);
                    _controller.text = '';
                  },
                ),
              ),
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
