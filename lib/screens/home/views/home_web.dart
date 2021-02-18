import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magicball/application/magic_state.dart';
import 'package:magicball/models/magic_model.dart';
import 'package:magicball/riverpod/riverpod.dart';
import 'package:magicball/widgets/widgets.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(flex: _size.width > 1340 ? 2 : 4, child: Container()),
        Expanded(
          flex: _size.width > 1340 ? 3 : 5,
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(magicNotifierProvider.state);
              if (state is MagicInitialState) {
                return buildInititalState();
              } else if (state is MagicLoadingState) {
                return buildLoading();
              } else if (state is MagicLoadedState) {
                return buildColumnWithData(state.magic);
              } else {
                return buildInititalState();
              }
            },
          ),
        ),
        Expanded(flex: _size.width > 1340 ? 2 : 4, child: Container()),
      ],
    );
  }
}

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
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
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
      MessageBox(),
      SizedBox(height: 50)
    ],
  );
}
