import 'package:cansat_gcs/parsers/telemetry_parser.dart';
import 'package:cansat_gcs/services/telemetry_simulator.dart';
import 'package:flutter/material.dart';

class TelemetryScreen extends StatelessWidget {
  const TelemetryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final simulator = TelemetrySimulator();
    final parser = TelemetryParser();

    return Scaffold(
      appBar: AppBar(title: const Text("CanSat CGS")),
      body: StreamBuilder(
        stream: simulator.generate(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final rawData = snapshot.data!;
          final telemetry = parser.parse(rawData);

          if(telemetry == null) {
            return const Center(
              child: Text("Invalid telemetry data"),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Timestamp: ${telemetry.timestamp}"),
                Text("Temperature: ${telemetry.temperature.toStringAsFixed(2)} C"),
                Text("Pressure: ${telemetry.pressure.toStringAsFixed(2)} hPa"),
                Text("Altitude: ${telemetry.altitude.toStringAsFixed(2)} m"),
                Text("Battery: ${telemetry.battery.toStringAsFixed(2)} V"),
              ],
            ),
          );
        },
      ),
    );
  }
}
