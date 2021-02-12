import 'package:flutter/material.dart';
import 'package:magicball/constants/constants.dart';
import 'package:magicball/widgets/widgets.dart';
import 'dart:math';
import 'package:sentiment_dart/sentiment_dart.dart';

class HomeWeb extends StatefulWidget {
  HomeWeb({Key key}) : super(key: key);

  @override
  _HomeWebState createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(flex: _size.width > 1340 ? 2 : 4, child: Container()),
        Expanded(
          flex: _size.width > 1340 ? 3 : 5,
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
                controller: _controller,
                onPressed: predictMagic,
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
        Expanded(flex: _size.width > 1340 ? 2 : 4, child: Container()),
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
