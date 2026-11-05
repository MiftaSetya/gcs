import 'package:cansat_gcs/models/telemetry_data.dart';

class TelemetryParser {
  TelemetryData? parse(String line) {
    try {
      final values = line.trim().split(',');

      if (values.length < 4) {
        return null;
      }

      return TelemetryData(
        timestamp: DateTime.now(),
        temperature: double.parse(values[0]),
        pressure: double.parse(values[1]),
        altitude: double.parse(values[2]),
        battery: double.parse(values[3]),
      );
    } catch (_) {
      return null;
    }
  }
}
