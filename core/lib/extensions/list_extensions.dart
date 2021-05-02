extension GenericdListExtensions<T> on List<T> {
  void addIfNotExist(T value) {
    if (!contains(value)) {
      add(value);
    }
  }
}
