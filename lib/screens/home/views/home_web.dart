import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magicball/application/magic_state.dart';
import 'package:magicball/riverpod/riverpod.dart';
import 'package:magicball/screens/home/views/components.dart';

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