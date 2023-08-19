import 'package:cats/core/api/api_consumer.dart';
import 'package:cats/core/api/app_interceptors.dart';
import 'package:cats/core/api/dio_consumer.dart';
import 'package:cats/core/network/netwok_info.dart';
import 'package:cats/features/cats_images/data/datasources/cats_images_remote_data_source.dart';
import 'package:cats/features/cats_images/data/repositories/cats_repository_impl.dart';
import 'package:cats/features/cats_images/domain/repositories/cats_repository.dart';
import 'package:cats/features/cats_images/domain/usecases/get_cats_images.dart';
import 'package:cats/features/cats_images/presentation/cubit/get_cats_images_cubit/get_cats_images_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<GetCatsImagesCubit>(
      () => GetCatsImagesCubit(getCatsImagesUseCase: sl()));


  // Use cases
  sl.registerLazySingleton<GetCatsImages>(
      () => GetCatsImages(catsRepository: sl()));


  // Repository
  sl.registerLazySingleton<CatsRepository>(
      () => CatsRepositoryImpl(catsImagesRemoteDataSource: sl(), networkInfo: sl()));

  // Data Sources
  sl.registerLazySingleton<CatsImagesRemoteDataSource>(
      () => CatsImagesRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
