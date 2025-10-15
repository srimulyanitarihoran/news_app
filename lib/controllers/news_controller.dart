import 'package:get/get.dart';
import 'package:news_app/models/news_articles.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/utils/constants.dart';

class NewsController extends GetxController {
  // untuk memproses request yang sudah dibuat oleh news services
  final NewsService _newsService = NewsService();

  //setter -> buay nge set
  // observable variables atau variable yang bisa berubah
  final _isLoading = false.obs; // apakah aplikasi sedang memuat berita
  final _articles = <NewsArticles>[].obs; // ini untuk menampilkan daftar berita yang sudah atau berhasil didpat
  final _selectedCategory = 'general'.obs;  // untuk handle kategory yang dipilih
  final _error = ''.obs; // kalau ada keasalahn bakal disimpan disini

  //Getters -> buat dapetin
  // ini seperti jendela untuk melihat isi variable yang sudah di definisikan, dengan ini UI bisa dnegan mudah melihat data dari controller
  bool get isLoading => _isLoading.value;
  List<NewsArticles> get articles => _articles;
  String get selectedCategory => _selectedCategory.value;
  String get error => _error.value;
  List<String> get categories => Constants.categories;

  // begitu aplikasi dibuka, aplikasi langsung menampilkan berita utama dari endpoint topheadlines
  //TODO: fetching data dari endpoint top-headlines

  Future<void> fetchTopHeadLines({String? category}) async {
    // blok ini akan dijalankan ketika rest api berhasil berkomunikasi dengan server
    try {
      _isLoading.value = true;
      _error.value = '';

      final response = await _newsService.getTopHeadLines(
        category: category ?? _selectedCategory.value,
      );

      _articles.value = response.articles;
    } catch (e) {
      _error.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to news: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM
      );
    } finally {
      // finally akan di execute akan dijalnkan ketika salah satu dari blok try atau catch sudah selesai mendapatkan ahsil
      _isLoading.value = false;
    }
  }

  Future<void> refreshNews() async {
    await fetchTopHeadLines();
  }

  void selectCategory(String category) {
    if (_selectedCategory.value != category) {
      _selectedCategory.value = category;
      fetchTopHeadLines(category: category);
    }
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty) return;

    try {
      _isLoading.value = true;
      _error.value = '';

      final response = await _newsService.searchNews(query: query);
      _articles.value = response.articles;
    } catch (e) {
      _error.value = e.toString();
      Get.snackbar(
        'error',
        'Failed to search news: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM
      );
    } finally {
      _isLoading.value = false;
    }
  }
}