import '../../bloc/cubit_base.dart';
import 'button_state.dart';

class ButtonCubit extends CubitBase<ButtonState> {
  ButtonCubit() : super(ButtonState.initialize());

  void setBusy({
    required bool busy,
  }) {
    emit(state.copyWith(
      busy: busy,
    ));
  }
}
