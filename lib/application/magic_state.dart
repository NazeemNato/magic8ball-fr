import 'package:magicball/models/magic_model.dart';

abstract class MagicState {
  const MagicState();
}

class MagicInitialState extends MagicState {
  const MagicInitialState();
}

class MagicLoadingState extends MagicState {
  const MagicLoadingState();
}

class MagicLoadedState extends MagicState {
  final Magic magic;

  MagicLoadedState(this.magic);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MagicLoadedState && o.magic == magic;
  }

  @override
  int get hashCode => magic.hashCode;
}

class MagicErrorState extends MagicState {
  final String error;

  MagicErrorState(this.error);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MagicErrorState && o.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
