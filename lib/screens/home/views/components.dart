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
        child: Blob.random(
          size: 400,
          edgesCount: 6,
          minGrowth: 9,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MagicTextWidget(
                  magicText: magic.question,
                  fontSize: 25.0,
                ),
                SizedBox(
                  height: 5,
                ),
                MagicTextWidget(
                  magicText: magic.response,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
      MessageBox(),
      SizedBox(height: 50)
    ],
  );
}
