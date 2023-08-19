import 'package:cats/core/error/failures.dart';
import 'package:cats/core/utils/app_strings.dart';
import 'package:cats/core/utils/usecase.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:cats/features/cats_images/domain/usecases/get_cats_images.dart';
import 'package:cats/features/cats_images/presentation/cubit/get_cats_images_cubit/get_cats_images_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCatsImagesCubit extends Cubit<GetCatsImagesStates> {
  final GetCatsImages getCatsImagesUseCase;

  GetCatsImagesCubit({required this.getCatsImagesUseCase}) : super(GetCatsImagesInitialState());

  Future<void> getCatsImages() async {
    emit(GetCatsImagesLoadingState());
    Either<Failure, List<Cat>> response = await getCatsImagesUseCase(NoParams());
    emit(response.fold((failure) => GetCatsImagesErrorState(error: _mapFailureToMsg(failure)),
        (catsImagesList) => GetCatsImagesSuccessState(catsImagesList: catsImagesList)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
