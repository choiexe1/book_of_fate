abstract interface class Repository<T, ID> {
  Future<List<T>> findAll();
  Future<T?> findById(ID id);
}
