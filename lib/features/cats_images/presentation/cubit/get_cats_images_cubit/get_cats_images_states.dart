import 'package:cats/features/cats_images/domain/entities/cat.dart';

abstract class GetCatsImagesStates {}

class GetCatsImagesInitialState extends GetCatsImagesStates{}
class GetCatsImagesLoadingState extends GetCatsImagesStates{}
class GetCatsImagesSuccessState extends GetCatsImagesStates{
  final List<Cat> catsImagesList;

  GetCatsImagesSuccessState({required this.catsImagesList});
}
class GetCatsImagesErrorState extends GetCatsImagesStates{
  final String error;

  GetCatsImagesErrorState({required this.error});
}
