import 'package:flutter_blue/flutter_blue.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_state.freezed.dart';

@freezed
class BleState with _$BleState {
  const factory BleState.initial({@Default([]) List<ScanResult> devices}) =
      Initial;
  const factory BleState.loading({@Default([]) List<ScanResult> devices}) =
      Loading;
  const factory BleState.loaded({@Default([]) List<ScanResult> devices}) =
      Loaded;
}
