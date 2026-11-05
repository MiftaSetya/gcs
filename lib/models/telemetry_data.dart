class TelemetryData {
  final DateTime timestamp;
  final double temperature;
  final double pressure;
  final double altitude;
  final double battery;

  const TelemetryData({
    required this.timestamp,
    required this.temperature,
    required this.pressure,
    required this.altitude,
    required this.battery
  });
}