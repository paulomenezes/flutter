import 'dart:math';

class Utils {
  static String generateRandomString(int len) {
    var random = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[random.nextInt(_chars.length)])
        .join();
  }

  static bool generateRandomEnabledState() {
    var random = Random();
    return random.nextInt(2) == 0 ? false : true;
  }
}
