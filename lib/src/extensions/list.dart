// ignore: public_member_api_docs
extension ListExt<E> on List<E> {
  /// A function to conditionally add an item based on a given condition.
  /// Parameters:
  /// - condition: a boolean indicating whether to add the item or not.
  /// - item: the item to be added.
  void addIf(bool Function() condition, E item) {
    if (condition()) add(item);
  }

  /// The first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// Example:
  /// ```dart
  /// final numbers = <int>[1, 2, 3, 5, 6, 7];
  /// var result = numbers.firstWhere((element) => element < 5); // 1
  /// result = numbers.firstWhere((element) => element > 5); // 6
  /// result =
  ///     numbers.firstWhere((element) => element > 10, orElse: () => -1); // -1
  /// ```
  ///
  /// If no element satisfies [test], the result will be [Null].
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }

    return null;
  }
}
