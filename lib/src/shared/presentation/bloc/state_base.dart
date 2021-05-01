import '../../domain/failures/failure.dart';

abstract class StateBase {
  const StateBase({
    required this.failure,
  });

  final Failure? failure;

  bool get hasFailure => failure == null;

  @override
  String toString() => '''$runtimeType { 
                            failure: $failure, 
                          }''';

  Future<void> dispose();
}
