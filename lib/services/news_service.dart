import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/utils/constants.dart';
// mendefinisikan sebuah packahge atau library menjadi sebuah variable secara langsung
import 'package:http/http.dart' as http;

class NewsService {
  static const String _baseUrl = Constants.baseUrl;
  static final String _apiKey = Constants.apiKey;

  // fungsi yang bertujuan untuk membuat request GET ke server
  Future<NewsResponse> getTopHeadLines({
    String country = Constants.defaultCountry,
    String? category,
    int page = 1,
    int pageSize = 20
  }) async {
    try {
      final Map<String, String> queryParams = {
        'apiKey': _apiKey,
        'country': country,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      };

      // statement yang akan dijalankan ketika category tidak kosong 
      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }

      // berfungsi untuk parsing data dari json ke UI
      // simplenya kita daftarin baseUrl + endpoint yang akan digunakan
      final uri = Uri.parse('$_baseUrl${Constants.topHeadLines}')
          .replace(queryParameters: queryParams);

          // untuk menyimpan respon yang di berikan oleh server
      final response = await http.get(uri);

      // kode yang dijalankan jika request ke API sukses
      if (response.statusCode == 200) {
        // untuk merubah data dari json ke bahasa dart
        final jsonData = json.decode(response.body);
        return NewsResponse.fromJson(jsonData);
        // kode yang akan dijalankan jika request ke API gagal atau (status HTTP =! 200)
      } else {
        throw Exception('Failed to load news, please try again later.');
      }
      // kode yang dijalankan ketika terjadi error lain, selain dari kode yang diatas
    } catch (e) {
      throw Exception('Another problem accurs, please try again later.');
    }
  }

  Future <NewsResponse> searchNews({
    // ini adalah nilai yang dimasukkin ke kolom pencarian
    required String query,
    int page = 1, // ini untuk mendefinisikan halaman berita ke berapa
    int pageSize = 20, // berapa banyak berita yang ingin ditampilkan ketika sekali proses rendering data
    String? sortBy,
  }) async {
    try {
      final Map<String, String> queryParams = {
        'apiKey': _apiKey,
        'key': query,
        'page': page.toString(),
        'pageSize': pageSize.toString()
      };

      if (sortBy != null && sortBy.isNotEmpty) {
        queryParams['sortBy'] = sortBy;
      }

      final uri = Uri.parse('$_baseUrl${Constants.everything}')
          .replace(queryParameters: queryParams);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return NewsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load news, please try again');
      }
    } catch (e) {
      throw Exception('another problem occurs, please try again later');
    }
  }
}