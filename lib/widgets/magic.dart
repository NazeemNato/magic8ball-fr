import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MagicSpin extends StatelessWidget {
  const MagicSpin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWanderingCubes(
        color: Colors.black87,
      ),
    );
  }
}
