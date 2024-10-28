import '../../core/network/network_client.dart';
import '../../core/network/network_constants.dart';
import '../models/character/character_model.dart';
import '../models/episode/episode_model.dart';
import '../models/location/location_model.dart';

class RickMortyService {
  RickMortyService({required NetworkClient networkClient})
      : _networkClient = networkClient;

  final NetworkClient _networkClient;

  Future<CharacterModel> getCharacters(
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _networkClient.get(NetworkConstants.character,
        queryParameters: queryParameters);
    return CharacterModel.fromJson(response.data!);
  }

  Future<EpisodeModel> getEpisodes(
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _networkClient.get(NetworkConstants.episode,
        queryParameters: queryParameters);
    return EpisodeModel.fromJson(response.data!);
  }

  Future<LocationModel> getLocations(
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _networkClient.get(NetworkConstants.location,
        queryParameters: queryParameters);
    return response.data!;
  }

  Future<List<CharacterModel>> getCharacterById(List<String> id) async {
    String ids = id.join(',');
    if (id.length == 1) ids = '$ids,';
    final response =
        await _networkClient.get('${NetworkConstants.character}/$ids');
    return (response.data! as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
  }

  Future<EpisodeModel> getEpisodeById(List<String> id) async {
    List<String> ids = id.map((e) => e.split('/').last).toList();
    String episodes = ids.join(',');
    if (ids.length == 1) episodes = '$episodes,';
    final response =
        await _networkClient.get('${NetworkConstants.episode}/$episodes');
    if (response.data is List) {
      return EpisodeModel(
          results:
              (response.data as List).map((e) => Episode.fromJson(e)).toList());
    } else {
      return EpisodeModel.fromJson(response.data!);
    }
  }

  Future<List<LocationModel>> getLocationById(List<String> id) async {
    String ids = id.join(',');
    if (id.length == 1) ids = '$ids,';
    final response =
        await _networkClient.get('${NetworkConstants.location}/$ids');
    return (response.data! as List)
        .map(
          (e) => LocationModel.fromJson(e),
        )
        .toList();
  }

  Future<CharacterModel> getCharacterByQuery(
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _networkClient.get(NetworkConstants.character,
        queryParameters: queryParameters);
    if (response.data != null) {
      return CharacterModel.fromJson(response.data!);
    }
    return CharacterModel();
  }
}
