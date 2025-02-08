import 'package:dio/dio.dart';
import 'package:star_github/data/repositories/api/api_urls.dart';
import '../../../core/local_database/hive_service.dart';
import '../../../core/models/hive_model.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();
  List<Item> items = [];

  Future<List<Item>?> fetchAndStoreItems({int page = 1, int perPage = 15, String q = 'Android', bool clearAll = false}) async {
    try {
      debugPrint("Fetching data from API... Page: $page, PerPage: $perPage");

      Response response = await _dio.get(
        ApiUrls().apiUrl,
        queryParameters: {
          'page': page,
          'per_page': perPage,
          'q': q,
        },
      );

      if (response.statusCode == 200) {
        if (response.data == null || response.data['items'] == null) {
          debugPrint("API response is empty or invalid");
          return null;
        }

        List<Item> newItems = (response.data['items'] as List)
            .map((item) => Item.fromMap(item))
            .toList();

        debugPrint("Fetched ${newItems.length} items from API");

        if (newItems.isNotEmpty) {
          await HiveService().storeItems(newItems, page, clearAll);
        }

        items = [...items,...newItems];

        return items; // Returns true if more data might be available
      } else {
        throw Exception("Failed to load data, Status Code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      debugPrint("Dio error: ${e.message}");
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      debugPrint("Unexpected error: $e");
      throw Exception("Unexpected error: $e");
    }
  }
}