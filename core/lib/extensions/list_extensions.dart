extension GenericdListExtensions<T> on List<T> {
  void addIfNotExist(T value) {
    if (!contains(value)) {
      add(value);
    }
  }

  void addOrRemove(T value) {
    if (!contains(value)) {
      add(value);
    } else {
      remove(value);
    }
  }
}
