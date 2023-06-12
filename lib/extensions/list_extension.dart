extension ListExtension<T> on List<T> {
  T? existsAt(int index) {
    return asMap()[index];
  }
}
