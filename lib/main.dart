import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider_data.dart';
import 'package:provider_demo/provider_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String data = 'hello world';
  @override
  Widget build(BuildContext context) {
    return const ProviderData();
  }
}
