import 'dart:math';

import 'package:magicball/models/magic_model.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

import 'package:magicball/constants/constants.dart';

abstract class MagicRepository {
  Future<Magic> getMagicResponse(String question);
}

class GetMagicResponse extends MagicRepository {
  @override
  Future<Magic> getMagicResponse(String question) async {
    return Future.delayed(Duration(seconds: 3), () {
      var random = Random();
      var sentiment = Sentiment();
      var response;
      var text = sentiment.analysis(question, emoji: true);
      if (text['score'] >= 0) {
        response = randomResponse[random.nextInt(randomResponse.length)];
      }else {
        response = negativeResponse[random.nextInt(negativeResponse.length)];
      }
      return Magic(
        question: question,
        response: response
      );
    });
  }
}
