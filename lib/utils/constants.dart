import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String baseUrl = 'https://newsapi.org/v2/';

  // Get API KEY from env Variables
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  //  list onf endpoints
  static const String topHeadLines = '/top-headlines';
  static const String everything = '/everything';

  // list of categories
  static const List<String> categories = [
    'general',
    'technology',
    'business',
    'sports',
    'health',
    'science',
    'entertainment',
  ];

  // countries
  static const String defaultCountry = 'us';

  // app info
  static const String appName = 'News App';
  static const String versionApp = '1.0.0';
}