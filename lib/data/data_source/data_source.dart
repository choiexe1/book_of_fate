abstract interface class DataSource<T> {
  Future<List<T>> fetch();
  Future<void> save(T data);
}
