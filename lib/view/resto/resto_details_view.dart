import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:foodspark/shared/color.dart';
import 'package:foodspark/view/resto/resto_details_viewModel.dart';

class RestoDetailsView extends StatelessWidget {
  final String? path;
  const RestoDetailsView({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestoDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate:
                      CustomSliverAppBar(expandedHeight: 200, path: path!)),
              buildImages()
            ],
          ),
        ),
      ),
      viewModelBuilder: () => RestoDetailsViewModel(),
    );
  }

  Widget buildImages() => SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ImageWidget(index: index),
          childCount: 20,
        ),
      );
}

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String path;
  CustomSliverAppBar({
    required this.expandedHeight,
    required this.path,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset, path),
        AppBar(
          shadowColor: Colors.transparent,
          leading: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 15,
              ),
              backButton(context)
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        buildAppBar(shrinkOffset, context),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
      fit: StackFit.expand,
    );
  }

  double appear(double shrinkOffSet) => shrinkOffSet / expandedHeight;
  double disappear(double shrinkOffSet) => 1 - shrinkOffSet / expandedHeight;

  Widget backButton(context) => IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kcPrimary,
        ),
      );

  Widget buildBackground(double shrinkOffset, String path) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Hero(
          tag: path,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildAppBar(double shrinkOffset, context) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: backButton(context),
          title: const Text("Title"),
          centerTitle: true,
          backgroundColor: kcWhite,
        ),
      );
  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          child: Row(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                  ),
                  Icon(
                    Icons.star,
                  )
                ],
              )),
              Expanded(child: buildButton(text: 'Like', icon: Icons.favorite)),
            ],
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
            child: Column(
          children: [
            Image.asset(
              'assets/images/m1.png',
              fit: BoxFit.cover,
            ),
            const Expanded(
              child: ListTile(
                title: Text("Mac1 Food"),
              ),
            )
          ],
        )),
      );
}
