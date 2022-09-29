import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinetime_companion/presentation/ble/state/ble_cubit.dart';
import 'package:pinetime_companion/presentation/ble/state/ble_state.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BleCubit, BleState>(builder: (bleContext, bleState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PineTime Companion'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 200,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: context.read<BleCubit>().scanForBleDevices,
                    child: bleState is Loading
                        ? const Text('Scanning now....')
                        : const Text('Scan for devices')),
              ),
            ),
            Expanded(
                child: ListView(
              children: bleState.devices
                  .map((device) => ListTile(
                      title: Text(device.device.name),
                      subtitle: Text(device.device.id.id)))
                  .toList(),
            ))
          ],
        ),
      );
    });
  }
}
