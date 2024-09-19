import "package:flutter_dotenv/flutter_dotenv.dart";

class Env {
  static String get weatherApiKey {
    return dotenv.env["WEATHER_API_KEY"] ?? "API_KEY_NOT_FOUND";
  }
}
