import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/users_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityImplAdapter());
  await appDI.initDependencies();
  await dataDI.initDependencies();
  runApp(const UsersApp());
}
