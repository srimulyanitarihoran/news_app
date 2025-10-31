import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news_app/bindings/app_bindings.dart';
import 'package:news_app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFA9D1D4),
                Color(0xFFF6F9E4),
              ],
            ),
          ),
          child: child,
        );
      },
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
