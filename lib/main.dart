import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_rick_and_morty/character/data/service/character_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          final CharacterService service = GetIt.I.get();
          final response = await service.getCharacters();
        },
        child: const Text('Click Here'),
      ),
    );
  }
}
