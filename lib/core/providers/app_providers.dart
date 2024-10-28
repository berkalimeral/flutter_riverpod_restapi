import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/service/rick_morty_service.dart';
import '../db/local_db_service.dart';
import '../network/network_client.dart';
import '../network/network_constants.dart';

class AppProviders {
  static final dioProvider = Provider<Dio>((ref) {
    return Dio();
  });

  static final networkClientProvider = Provider<NetworkClient>((ref) {
    return NetworkClient(
        dio: ref.watch(dioProvider), baseUrl: NetworkConstants.baseUrl);
  });

  static final rickMortyServiceProvider = Provider<RickMortyService>((ref) {
    return RickMortyService(networkClient: ref.watch(networkClientProvider));
  });

  static final localDbServiceProvider = Provider<LocalDbService>((ref) {
    return LocalDbService.instance;
  });
}
