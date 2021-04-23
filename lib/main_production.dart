import 'environment_variable.dart';
import 'main.dart';

void main() async {
  await mainDelegate(
    Environment.prod,
  );
}
