extension GenericdIterableExtensions<T> on Iterable<T> {
  Iterable<T> skipLast() {
    return take(length - 1);
  }

  Map<TKey, T> toLookupMap<TKey>(
    TKey Function(T e) keyBuilder,
  ) {
    return {
      for (var entry in this) keyBuilder(entry): entry,
    };
  }
}
