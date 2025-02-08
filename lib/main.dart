import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/homescreen_view.dart';
import 'package:star_github/utils/themes/custom_theme.dart';

import 'core/models/hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(LicenseAdapter());
  Hive.registerAdapter(OwnerAdapter());
  Hive.registerAdapter(AppDataAdapter());
  await Hive.openBox<Item>('items');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customTheme,
      home: HomeScreen(),
    );
  }
}


