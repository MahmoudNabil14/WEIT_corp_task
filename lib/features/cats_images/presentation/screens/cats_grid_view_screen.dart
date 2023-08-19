import 'package:cats/features/cats_images/presentation/cubit/get_cats_images_cubit/get_cats_images_cubit.dart';
import 'package:cats/features/cats_images/presentation/cubit/get_cats_images_cubit/get_cats_images_states.dart';
import 'package:cats/features/cats_images/presentation/widgets/cats_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:cats/core/widgets/error_widget.dart' as error_widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CatsGridViewScreen extends StatefulWidget {
  const CatsGridViewScreen({super.key,});


  @override
  State<CatsGridViewScreen> createState() => _CatsGridViewScreenState();
}

class _CatsGridViewScreenState extends State<CatsGridViewScreen> {
  _getCatsImages() =>
      BlocProvider.of<GetCatsImagesCubit>(context).getCatsImages();

  @override
  void initState() {
    super.initState();
    _getCatsImages();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<GetCatsImagesCubit, GetCatsImagesStates>(
        builder: ((context, state) {
          if (state is GetCatsImagesLoadingState) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
              ),
            );
          } else if (state is GetCatsImagesErrorState) {
            return error_widget.ErrorWidget(
              onPress: () => _getCatsImages(),
            );
          } else if (state is GetCatsImagesSuccessState) {
            return Column(
              children: [
                Expanded(child: CatsGridView(catsImagesList: state.catsImagesList,)),
                InkWell(
                    onTap: () => _getCatsImages(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: const Icon(
                        Icons.refresh,
                        size: 28,
                        color: Colors.white,
                      ),
                    ))
              ],
            );
          } else {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
              ),
            );
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 1,
    child: Scaffold(appBar: AppBar(
      title: const Text('Cat Images'),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Cats'),
        ],
      ),
    ), body: _buildBodyContent()));
  }

}