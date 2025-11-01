// unduk
// part -> sebuah keyword kalo misal dia adalh induk, bisa berdiri sendiri tanpa bantuan
import 'package:get/get.dart';
import 'package:news_app/bindings/home_bindings.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/screens/notifications_header.dart';
import 'package:news_app/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._(); // function private anonymous

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBindings(), // binding buat manggil semua yang ada di controller
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationsScreen(),
    ),
  ];
}