extension IterableExtensions<TElement> on Iterable<TElement>? {
  bool isNullOrEmpty() => this == null || (this != null && this!.isEmpty);
}
