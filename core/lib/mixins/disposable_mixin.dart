import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

mixin DisposableMixin {
  final _dispose$ = PublishSubject<void>();

  Stream<void> get dispose$ => _dispose$.stream.asBroadcastStream();

  @mustCallSuper
  Future<void> dispose() async {
    _dispose$.add(null);
  }
}
