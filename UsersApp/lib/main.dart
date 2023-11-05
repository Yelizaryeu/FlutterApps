import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:data/di/data_di.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/letter_mate_app.dart';

late Box box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  print('init appDI start');
  await appDI.initDependencies();
  print('init dataDI start');
  await dataDI.initDependencies();
  print('running LetterMateApp');
  runApp(const LetterMateApp());
}

// class LetterMateApp extends StatelessWidget {
//
//   const LetterMateApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ProfileBloc>(
//             create: (context) =>
//             serviceLocator<ProfileBloc>()..add(DatabaseFetchedEvent(serviceLocator.get<UserEntity>(instanceName: 'currentUser').displayName))),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: ProfileViewScreen(),
//       ),
//     );
//   }
// }
