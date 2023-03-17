import 'package:flutter_rick_and_morty/details/data/service/character_details_response.dart';
import 'package:flutter_rick_and_morty/details/data/service/character_details_service.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterDetailsRepository {
  Future<CharacterDetailsResponse> getCharacterDetails(String id);
}

@Injectable(as: CharacterDetailsRepository)
class CharacterDetailsRepositoryImpl implements CharacterDetailsRepository {
  const CharacterDetailsRepositoryImpl(this._service);

  final CharacterDetailsService _service;

  @override
  Future<CharacterDetailsResponse> getCharacterDetails(String id) =>
      _service.getCharacterDetails(id);
}
