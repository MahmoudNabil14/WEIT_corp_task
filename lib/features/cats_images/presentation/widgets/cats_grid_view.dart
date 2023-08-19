import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats/config/routes/app_routes.dart';
import 'package:cats/core/utils/navigators.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CatsGridView extends StatelessWidget {
  const CatsGridView({Key? key, required this.catsImagesList}) : super(key: key);
  final List<Cat> catsImagesList;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            axisDirection: AxisDirection.down,
            crossAxisCount: 2,
            children: catsImagesList
                .map((cat) => Stack(
              alignment: Alignment.bottomLeft,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.push(routeName: Routes.catDetails, arguments: cat);
                        },
                        child: CachedNetworkImage(
                          imageUrl: cat.url,
                          fit: BoxFit.cover,
                          placeholder: (context, value) => Container(
                            color: Colors.grey[500],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(cat.id, style: const TextStyle(fontSize: 16,color: Colors.white),),
                    )
                  ],
                ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
