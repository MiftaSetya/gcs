import 'dart:math';

class TelemetrySimulator {
  final Random _random = Random();

  Stream<String> generate() async* {
    double altitude = 0;

    while (true) {
      altitude += 1 + _random.nextDouble() * 3;
      final temperature = 28 + _random.nextDouble();
      final pressure = 1013 - _random.nextDouble() * 3;
      final battery = 8.4 - altitude * 0.002;

      final shouldCorrupt = _random.nextInt(10) == 0;

      if (shouldCorrupt) {
        yield "Invalid Data";
      } else {
        yield "$temperature,$pressure,$altitude,$battery";
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
