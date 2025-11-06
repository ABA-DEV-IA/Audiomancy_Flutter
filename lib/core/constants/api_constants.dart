import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String BASE_URL = 'http://localhost:8000';
  static String get API_KEY => dotenv.env['API_KEY'] ?? '' ; // Load API key from .env
}
