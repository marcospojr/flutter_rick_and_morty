import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_rick_and_morty/character/data/service/character_service.dart';

void main() {
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
        onPressed: () {
          final CharacterService service = CharacterServiceImpl(
            Dio(
              BaseOptions(
                baseUrl: 'https://rickandmortyapi.com/api/',
              ),
            )..interceptors.add(PrettyDioLogger()),
          );
          service.getCharacters();
        },
        child: const Text('Click Here'),
      ),
    );
  }
}
