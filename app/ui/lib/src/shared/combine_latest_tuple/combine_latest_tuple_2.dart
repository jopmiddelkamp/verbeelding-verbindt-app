import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

Stream<Tuple2<T1, T2>> combineLatestTuple2<T1, T2>({
  required Stream<T1> stream1,
  T1? initialValue1,
  required Stream<T2> stream2,
  T2? initialValue2,
}) {
  return Rx.combineLatest2<T1, T2, Tuple2<T1, T2>>(
    initialValue1 == null ? stream1 : stream1.startWith(initialValue1),
    initialValue2 == null ? stream2 : stream2.startWith(initialValue2),
    (item1, item2) => Tuple2<T1, T2>(
      item1,
      item2,
    ),
  );
}
