import 'package:cats/core/error/failures.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:dartz/dartz.dart';

abstract class CatsRepository {
  Future<Either<Failure, List<Cat>>> getCatsImages();
}
