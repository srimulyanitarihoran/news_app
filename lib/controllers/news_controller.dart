import 'package:get/get.dart';
import 'package:news_app/models/news_articles.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/utils/constants.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();

  // ⏳ loading indicator (buat nampilin loading pas fetch)
  final _isLoading = false.obs;

  // 📰 semua berita yang lagi ditampilin di home/search
  final _articles = <NewsArticles>[].obs;

  // 🔔 notifikasi (berita terbaru)
  final _notifications = <NewsArticles>[].obs;

  // 📂 kategori berita (default = general)
  final _selectedCategory = 'general'.obs;

  // ❌ pesan error kalo API gagal
  final _error = ''.obs;

  // 🔘 buat navbar bawah
  var selectedIndex = 0.obs;

  void onNavTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchTopHeadLines(); // ambil berita pas pertama kali dibuka
  }

  // getter biar gampang dipanggil dari UI
  bool get isLoading => _isLoading.value;
  List<NewsArticles> get articles => _articles;
  List<NewsArticles> get notifications => _notifications;
  String get selectedCategory => _selectedCategory.value;
  String get error => _error.value;
  List<String> get categories => Constants.categories;

  // ✅ ambil berita utama dari API (top-headlines)
  Future<void> fetchTopHeadLines({String? category}) async {
    try {
      _isLoading.value = true;
      _error.value = '';

      final response = await _newsService.getTopHeadLines(
        category: category ?? _selectedCategory.value,
      );

      _articles.assignAll(response.articles);
    } catch (e) {
      // kalo error, langsung munculin snackbar
      Future.delayed(Duration.zero, () {
        _error.value = e.toString();
        Get.snackbar(
          'Error',
          'Gagal ambil berita: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } finally {
      _isLoading.value = false;
    }
  }

  // 🔁 buat refresh berita
  Future<void> refreshNews() async {
    await fetchTopHeadLines();
  }

  // 🏷️ ganti kategori berita
  void selectCategory(String category) {
    if (_selectedCategory.value != category) {
      _selectedCategory.value = category;
      Future.delayed(Duration.zero, () {
        fetchTopHeadLines(category: category);
      });
    }
  }

  // 🔍 cari berita dari endpoint everything
  Future<void> searchNews(String query) async {
    if (query.isEmpty) return;

    try {
      _isLoading.value = true;
      _error.value = '';

      final response = await _newsService.searchNews(query: query);
      _articles.assignAll(response.articles);
    } catch (e) {
      Future.delayed(Duration.zero, () {
        _error.value = e.toString();
        Get.snackbar(
          'Error',
          'Gagal cari berita: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } finally {
      _isLoading.value = false;
    }
  }

  // 🔔 ambil data buat notifikasi (berita terbaru limit 5)
  Future<void> fetchNotifications() async {
    try {
      _isLoading.value = true;
      _error.value = '';

      final response = await _newsService.getTopHeadLines(
        category: 'general',
      );

      // ambil 5 berita terbaru aja
      _notifications.assignAll(response.articles.take(5).toList());
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }
}
