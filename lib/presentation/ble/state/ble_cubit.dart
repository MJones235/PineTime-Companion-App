import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pinetime_companion/presentation/ble/state/ble_state.dart';

class BleCubit extends Cubit<BleState> {
  BleCubit({required this.flutterBlue}) : super(const Initial()) {
    scanForBleDevices();
  }

  FlutterBlue flutterBlue;

  void scanForBleDevices() async {
    if (state is! Loading) {
      emit(Loading(devices: state.devices));
      final devices =
          await flutterBlue.startScan(timeout: const Duration(seconds: 5));
      emit(Loaded(devices: devices));
    }
  }
}
