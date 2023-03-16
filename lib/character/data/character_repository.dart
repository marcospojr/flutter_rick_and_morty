import 'package:flutter_rick_and_morty/character/data/service/character_response.dart';
import 'package:flutter_rick_and_morty/character/data/service/character_service.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterRepository {
  Future<CharacterApiResponse> getCharacters(int page);
}

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl(this._service);

  final CharacterService _service;

  @override
  Future<CharacterApiResponse> getCharacters(int page) =>
      _service.getCharacters(page);
}
