import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magicball/application/magic_state.dart';
import 'package:magicball/repository/magic_repository.dart';

class MagicNotifier extends StateNotifier<MagicState> {
  final MagicRepository _magicRepository;
  MagicNotifier(this._magicRepository) : super(MagicInitialState());

  Future<void> getResponse(String question) async {
    try {
      state = MagicLoadingState();
      final magic = await _magicRepository.getMagicResponse(question);
      state = MagicLoadedState(magic);
    } catch (err) {
      state = MagicErrorState('Something went wrong');
    }
  }
}
