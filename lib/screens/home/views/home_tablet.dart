import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magicball/constants/constants.dart';
import 'package:magicball/widgets/widgets.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class HomeTablet extends StatefulWidget {
  HomeTablet({Key key}) : super(key: key);

  @override
  _HomeTabletState createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet> {
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
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(flex: _size.width > 650 ? 1 : 4, child: Container()),
        Expanded(
          flex: _size.width > 650 ? 3 : 6,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: loader
                      ? MagicSpin()
                      : MagicTextWidget(magicText: magicText),
                ),
              ),
              MessageBox(
               
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
        Expanded(flex: _size.width > 650 ? 1 : 4, child: Container()),
      ],
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
