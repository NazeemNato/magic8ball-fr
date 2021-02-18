import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magicball/riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageBox extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.montserrat(),
                hintText: 'Type your question here...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
         IconButton(
           icon: Icon(Icons.star),
           iconSize: 30,
           color: Colors.black87,
           onPressed: (){
              if (_controller.text.trim().isNotEmpty) {
                submitQuestion(context, _controller.text);
              }
           },
         )
        ],
      ),
    );
  }

  void submitQuestion(BuildContext context, String question) {
    context.read(magicNotifierProvider).getResponse(question);
  }
}
