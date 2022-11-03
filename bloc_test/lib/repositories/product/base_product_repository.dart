import 'package:bloc_test/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
