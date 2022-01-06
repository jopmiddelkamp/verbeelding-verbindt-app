import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

Stream<Tuple3<T1, T2, T3>> combineLatestTuple3<T1, T2, T3>({
  required Stream<T1> stream1,
  T1? initialValue1,
  required Stream<T2> stream2,
  T2? initialValue2,
  required Stream<T3> stream3,
  T3? initialValue3,
}) {
  return Rx.combineLatest3<T1, T2, T3, Tuple3<T1, T2, T3>>(
    initialValue1 == null ? stream1 : stream1.startWith(initialValue1),
    initialValue2 == null ? stream2 : stream2.startWith(initialValue2),
    initialValue3 == null ? stream3 : stream3.startWith(initialValue3),
    (item1, item2, item3) => Tuple3<T1, T2, T3>(
      item1,
      item2,
      item3,
    ),
  );
}
