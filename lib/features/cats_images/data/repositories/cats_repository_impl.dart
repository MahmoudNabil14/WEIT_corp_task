import 'package:cats/core/error/exceptions.dart';
import 'package:cats/core/error/failures.dart';
import 'package:cats/core/network/netwok_info.dart';
import 'package:cats/features/cats_images/data/datasources/cats_images_remote_data_source.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:cats/features/cats_images/domain/repositories/cats_repository.dart';
import 'package:dartz/dartz.dart';

class CatsRepositoryImpl implements CatsRepository {
  final NetworkInfo networkInfo;
  final CatsImagesRemoteDataSource catsImagesRemoteDataSource;

  CatsRepositoryImpl(
      {required this.networkInfo,
      required this.catsImagesRemoteDataSource,
      });

  @override
  Future<Either<Failure, List<Cat>>> getCatsImages() async {
    try {
      final remoteRandomQuote =
          await catsImagesRemoteDataSource.getCatsImages();
      return Right(remoteRandomQuote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
