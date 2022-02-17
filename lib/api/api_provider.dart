import 'package:dio/dio.dart';
import 'package:interview_task/models/product.dart';

class ApiProvider {
  Dio dio = Dio();
  final baseUrl = "https://api.npoint.io/";
  Future<List<Product>> getProductList() async {
    try {
      final response = await dio.get(
        baseUrl + 'a907f54f4d95e9e31711',
        options: Options(
          headers: {},
        ),
      );
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioError catch (e) {
      throw e.response!.data['error'];
    }
  }
}
