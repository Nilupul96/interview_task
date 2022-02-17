import 'package:interview_task/api/api_provider.dart';
import 'package:interview_task/models/product.dart';

class Repository {
  final apiProvider = ApiProvider();
  Future<List<Product>> getProductList() => apiProvider.getProductList();
}
