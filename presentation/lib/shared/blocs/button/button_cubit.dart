import '../../widgets/buttons/../../blocs/button/button_state.dart';
import '../cubit_base.dart';

class ButtonCubit extends CubitBase<ButtonState> {
  ButtonCubit() : super(const ButtonState.idle());

  Future<void> setBusy() async {
    emit(const ButtonState.busy());
  }

  Future<void> setIdle() async {
    emit(const ButtonState.idle());
  }
}
