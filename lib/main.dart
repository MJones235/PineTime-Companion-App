import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pinetime_companion/presentation/ble/Devices.dart';
import 'package:pinetime_companion/presentation/ble/state/ble_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PineTime Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => BleCubit(flutterBlue: FlutterBlue.instance),
        child: const Devices(),
      ),
    );
  }
}
