
import 'package:cats/features/cats_images/domain/entities/cat.dart';

class CatModel extends Cat {
  const CatModel(
      {required String id,
      required String url,
      required int height,
      required int width})
      : super(id: id, url: url, height: height, width: width);

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        id: json["id"],
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );
}
