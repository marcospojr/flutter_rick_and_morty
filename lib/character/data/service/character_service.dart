import 'package:dio/dio.dart';

abstract class CharacterService {
  Future<void> getCharacters([int page = 1]);
}

class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> getCharacters([int page = 1]) async {
    final response = _dio.get(
      'character',
      queryParameters: {'page': page},
    );
  }
}
