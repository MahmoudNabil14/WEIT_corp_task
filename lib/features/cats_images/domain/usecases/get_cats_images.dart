import 'package:cats/core/error/failures.dart';
import 'package:cats/core/utils/usecase.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:cats/features/cats_images/domain/repositories/cats_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatsImages implements UseCase<List<Cat>, NoParams> {
  final CatsRepository catsRepository;

  GetCatsImages({required this.catsRepository});
  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) =>
      catsRepository.getCatsImages();
}
