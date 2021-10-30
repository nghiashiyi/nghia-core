import 'package:adroit_flutter/core/utils/flavor_config.dart';
import 'package:get_it/get_it.dart';

GetIt get = GetIt.instance;

void setupLocator({required FlavorConfig flavorConfig}) {
  /// Use cases
  // get.registerLazySingleton(() => AddStock(adroitSharedRepository: get()));


  /// Repository
  // get.registerLazySingleton<PlaybookRepository>(
  //   () => PlaybookRepositoryImpl(playbookFirebaseRemoteDataSource: get()),
  // );

  /// Data sources
  // get.registerLazySingleton<AdroitFirebaseRemoteDataSource>(
  //     () => AdroitFirebaseRemoteDataSourceImpl(flavorConfig: flavorConfig));

  /// Other services
}
