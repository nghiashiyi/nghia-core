import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavors { prod, dev }

class FlavorConfig {
  static final _flavorConfig = FlavorConfig();

  static FlavorConfig get instance => _flavorConfig;

  Flavors? flavor;

  Future<void> init(Flavors flavor) async {
    _flavorConfig.flavor ??= flavor;
    await dotenv.load(fileName: "assets/config/${getFlavor()}/.env");
  }

  String getFlavor() {
    return flavor.toString().split('.').last.toLowerCase();
  }

  String getAppId() {
    return dotenv.get('APP_ID');
  }

  String getStatisticBaseUrl() {
    return dotenv.get('STATISTIC_BASE_URL');
  }

  String getStatisticApiKey() {
    return dotenv.get('STATISTIC_API_KEY');
  }

  String getNewsBaseUrl() {
    return dotenv.get('NEWS_BASE_URL');
  }

  String getNewsApiKey() {
    return dotenv.get('NEWS_API_KEY');
  }

  String getHistoricalStockBaseUrl() {
    return dotenv.get('HISTORICAL_STOCK_BASE_URL');
  }

  String getHistoricalStockApiKey() {
    return dotenv.get('HISTORICAL_STOCK_API_KEY');
  }
}
