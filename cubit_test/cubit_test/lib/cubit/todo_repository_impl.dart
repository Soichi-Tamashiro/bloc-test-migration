class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  Future<List<Data>> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}
