import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magicball/application/magic_state.dart';
import 'package:magicball/riverpod/riverpod.dart';

import 'components.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
    );
  }
}
