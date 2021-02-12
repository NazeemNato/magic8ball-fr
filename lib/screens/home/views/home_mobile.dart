import 'package:flutter/material.dart';
import 'package:magicball/widgets/widgets.dart';

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
              child:
                  loader ? MagicSpin() : MagicTextWidget(magicText: magicText),
            ),
          ),
          MessageBox(
            controller: _controller,
            onPressed: () {},
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
