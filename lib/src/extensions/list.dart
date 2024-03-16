// ignore: public_member_api_docs
extension ListUtils<T> on List<T> {
  /// A function to conditionally add an item based on a given condition.
  /// Parameters:
  /// - condition: a boolean indicating whether to add the item or not.
  /// - item: the item to be added.
  void addIf(bool Function() condition, T item) {
    if (condition()) add(item);
  }
}
