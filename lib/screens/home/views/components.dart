import 'package:flutter/material.dart';
import 'package:magicball/models/magic_model.dart';
import 'package:magicball/widgets/widgets.dart';
import 'package:blobs/blobs.dart';

Widget buildInititalState() {
  return Column(
    children: [
      Expanded(
        child: Center(
          child: MagicTextWidget(
            magicText: 'Ask me a Yes or No question!',
          ),
        ),
      ),
      MessageBox(),
      SizedBox(height: 50)
    ],
  );
}

Widget buildLoading() {
  return Center(
    child: MagicSpin(),
  );
}

Widget buildColumnWithData(Magic magic) {
  return Column(
    children: [
      Expanded(
        child:Center(
           child:Container(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MagicTextWidget(
                  magicText: magic.question,
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                MagicTextWidget(
                  magicText: magic.response,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),),
      ),
      MessageBox(),
      SizedBox(height: 50)
    ],
  );
}
