import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/home/presentation/page/home_page.dart';
import 'package:flutter_rick_and_morty/injection.dart';
import 'package:flutter_rick_and_morty/shared/theme/application_theme.dart';
import 'package:flutter_rick_and_morty/shared/theme/data/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ApplicationTheme.themes[AppTheme.piano]?.themeData,
      home: const HomePage(),
    );
  }
}
