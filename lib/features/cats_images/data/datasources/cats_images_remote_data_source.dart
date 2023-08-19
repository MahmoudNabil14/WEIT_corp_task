import 'package:cats/core/api/api_consumer.dart';
import 'package:cats/core/api/end_points.dart';
import 'package:cats/features/cats_images/data/models/cat_model.dart';

abstract class CatsImagesRemoteDataSource {
  Future<List<CatModel>> getCatsImages();
}

class CatsImagesRemoteDataSourceImpl implements CatsImagesRemoteDataSource {
  ApiConsumer apiConsumer;

  CatsImagesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<CatModel>> getCatsImages() async {
    List<CatModel> catsImagesList = [];
    final response = await apiConsumer.get(
      EndPoints.baseUrl,
    );
    for(var cat in response){
      catsImagesList.add(CatModel.fromJson(cat));
    }
    return catsImagesList;
  }
}
