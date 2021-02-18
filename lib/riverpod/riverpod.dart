import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magicball/application/magic_notifier.dart';
import 'package:magicball/repository/magic_repository.dart';

final magicRepository = Provider<MagicRepository>(
  (ref) => GetMagicResponse(),
);

final magicNotifierProvider = StateNotifierProvider(
  (ref) => MagicNotifier(
    ref.watch(magicRepository),
  ),
);
