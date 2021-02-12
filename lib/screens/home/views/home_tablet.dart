import 'package:flutter/material.dart';
import 'package:magicball/widgets/widgets.dart';

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
                controller: _controller,
                onPressed: () {},
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
        Expanded(flex: _size.width > 650 ? 1 : 4, child: Container()),
      ],
    );
  }
}
