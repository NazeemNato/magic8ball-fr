import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  const MessageBox({
    Key key,
    @required this.controller,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: GoogleFonts.montserrat(),
              controller: controller,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(),
                hintText: 'Type your question here...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          FlatButton(
            child: Container(
              child: Center(
                child: Text(
                  '✨',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            onPressed: onPressed,
            // shape: CircleBorder(
            //   side: BorderSide(
            //     color: Colors.blue,
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
