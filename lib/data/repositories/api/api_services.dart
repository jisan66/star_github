import 'package:dio/dio.dart';
import 'package:star_github/data/repositories/api/api_urls.dart';
import '../../../core/local_database/hive_service.dart';
import '../../../core/models/hive_model.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> fetchAndStoreItems({int page = 1, int perPage = 10, String q = 'Android' , clearAll = false}) async {
    try {
      Response response = await _dio.get(
        ApiUrls().apiUrl,
        queryParameters: {
          'page': page,       // Page number for pagination
          'per_page': perPage, // Number of items per page
          'q': q,       // Sorting criteria
        },
      );

      debugPrint("///////////////////////////////////////////////////////////////////////");

      if (response.statusCode == 200) {
        List<Item> items = (response.data['items'] as List)
            .map((item) => Item.fromMap(item))
            .toList();

        debugPrint("---------------------------------------------------------------------");
        await HiveService().storeItems(items, page, clearAll);
      } else {
        throw Exception("Failed to load data, Status Code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
