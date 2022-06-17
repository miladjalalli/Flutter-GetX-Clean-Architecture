import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/app/dependency.dart';
import 'package:getx_clean_architecture/presentation/app.dart';

void main() {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

