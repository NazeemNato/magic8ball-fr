import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magicball/constants/constants.dart';
import 'package:magicball/widgets/widgets.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class HomeMobile extends StatefulWidget {
  HomeMobile({Key key}) : super(key: key);

  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  TextEditingController _controller;
  bool loader = false;
  String magicText;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    magicText = 'Ask me a Yes or No question!';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: loader
                  ? MagicSpin()
                  : MagicTextWidget(
                      magicText: magicText
                    ),
            ),
          ),
          MessageBox(
            
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }

  void predictMagic() async {
    if (_controller.text.isNotEmpty) {
      var random = Random();
      var sentiment = Sentiment();
      setState(() {
        loader = true;
      });
      var text = sentiment.analysis(_controller.text, emoji: true);
      await Future.delayed(Duration(seconds: 3));
      if (text['score'] >= 0) {
        var word = randomResponse[random.nextInt(randomResponse.length)];
        setState(() {
          magicText = word;
          loader = false;
          _controller.clear();

        });
      } else {
        var word = negativeResponse[random.nextInt(negativeResponse.length)];
        setState(() {
          magicText = word;
          loader = false;
          _controller.clear();
        });
      }
    }
  }
}
