import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venuze_app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const VenuzeApp());
}
