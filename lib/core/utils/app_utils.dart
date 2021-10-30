import 'package:uuid/uuid.dart';

class AppUtils {
  static String generateId() {
    return'${Uuid().v4()}-${DateTime.now().millisecondsSinceEpoch}';
  }
}