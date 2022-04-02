import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodspark/shared/color.dart';
import 'package:foodspark/shared/ui/ui_helper.dart';
import 'package:foodspark/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: model.showFavPage,
              icon: const Icon(
                Icons.favorite,
                color: kcWhite,
              ),
            ),
            horizontalSpaceSmall,
            IconButton(
              onPressed: model.showCartPage,
              icon: const Icon(
                Icons.shopping_cart,
                color: kcWhite,
              ),
            ),
            horizontalSpaceSmall,
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: kcPrimary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      color: kcWhite,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      "Juan Dela Cruz",
                      style: TextStyle(color: kcWhite),
                    )
                  ],
                ),
              ),
              headerListTile("Profile"),
              headerListTile("Suggested products"),
              headerListTile("Promotions"),
              headerListTile("Settings"),
              headerListTile("Vouchers"),
              const Divider(),
              headerListTile("Terms and conditions"),
              headerListTile("Logout")
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titles("Special Offers"),
                      Expanded(
                        child: CarouselSlider(
                            items: model.items,
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: (int, carousel) {},
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                      // Dotstepper
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titles("Categories"),
                      Expanded(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          category("assets/images/fastfood.png"),
                          category("assets/images/beverage.png"),
                          category("assets/images/asian.png"),
                          category("assets/images/bread.png"),
                        ],
                      ))
                    ],
                  ),
                )),
                Expanded(
                    flex: 3,
                    child: ListView(
                      children: [
                        restoCard(context, "assets/images/jolly.jpeg",
                            model.showRestoDetailsPage),
                        restoCard(context, "assets/images/macdo.jpg",
                            model.showRestoDetailsPage)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

Widget titles(text) => Text(
      text,
      style: const TextStyle(color: kcGrayDark, fontWeight: FontWeight.bold),
    );

Widget category(String path) => SizedBox(
      width: 100,
      child: Card(
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );

Widget headerListTile(String title) => ListTile(
      title: Text(title),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );

Widget restoCard(context, String path, Function(String x) onTap) => SizedBox(
      height: 150,
      width: screenWidth(context),
      child: GestureDetector(
        onTap: () {
          onTap(path);
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Hero(
            tag: path,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
