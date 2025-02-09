import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_github/presentation/details_screen/details_screen.dart';
import 'package:star_github/presentation/home_screen/bloc/home_screen_bloc.dart';
import 'package:star_github/presentation/home_screen/homescreen_view.dart';
import 'package:star_github/utils/themes/custom_theme.dart';

import 'core/models/hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 7));

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
    return BlocProvider(
      create:  (_) => StarGithubBloc()..add(FetchStarGithubRepos(false, 1)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: customTheme,
        home: HomeScreen(),
      ),
    );
  }
}


