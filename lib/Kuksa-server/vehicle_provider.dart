import 'package:dashboard_app/Kuksa-server/vehicle_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vehicleSignalProvider =
    StateNotifierProvider<VehicleSignalNotifier, VehicleSignal>(
  (ref) => VehicleSignalNotifier(),
);

class VehicleSignalNotifier extends StateNotifier<VehicleSignal> {
  VehicleSignalNotifier() : super(_initialValue);
  static final VehicleSignal _initialValue = VehicleSignal(
    speed: 140,
    rpm: 7000,
    fuelLevel: 90,
    frontRightTP: 30,
    frontLeftTP: 30,
    rearRightTP: 30,
    rearLeftTP: 30,
    isChildLockActiveLeft: true,
    isChildLockActiveRight: true,
    isBatteryCharging: true,
    currentLatitude: 37.772701,
    currentLongitude: -122.416626,
    fuelRate: 21,
  );
  void update({
    double? speed,
    double? rpm,
    double? fuelLevel,
    double? frontLeftTP,
    double? frontRightTP,
    double? rearLeftTP,
    double? rearRightTP,
    bool? isBatteryCharging,
    bool? isChildLockActiveLeft,
    bool? isChildLockActiveRight,
    double? currentLatitude,
    double? currentLongitude,
    double? fuelRate,
  }) {
    state = state.copyWith(
      speed: speed,
      rpm: rpm,
      fuelLevel: fuelLevel,
      frontLeftTP: frontLeftTP,
      frontRightTP: frontRightTP,
      rearLeftTP: rearLeftTP,
      rearRightTP: rearRightTP,
      isChildLockActiveLeft: isChildLockActiveLeft,
      isChildLockActiveRight: isChildLockActiveRight,
      isBatteryCharging: isBatteryCharging,
      currentLatitude: currentLatitude,
      currentLongitude: currentLongitude,
      fuelRate: fuelRate,
    );
  }
}