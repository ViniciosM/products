import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:products/app_module.dart';
import 'package:products/app_widget.dart';
import 'package:products/core/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
