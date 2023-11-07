import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'app/users_app.dart';

void main() async {
  await initHive();
  WidgetsFlutterBinding.ensureInitialized();
  await appDI.initDependencies();
  await dataDI.initDependencies();
  runApp(const UsersApp());
}
