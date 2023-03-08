import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty/character/data/service/character_response.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterService {
  Future<CharacterApiResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<CharacterApiResponse> getCharacters([int page = 1]) async {
    final response = await _dio.get(
      'character',
      queryParameters: {'page': page},
    );

    if (response.statusCode == 200) {
      return CharacterApiResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
