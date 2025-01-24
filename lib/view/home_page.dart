import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/home_controller.dart';
import 'package:tourist_application/statics/static.dart';
import 'package:tourist_application/view/category_page.dart';
import 'package:tourist_application/view/favorite_page.dart';
import 'package:tourist_application/view/filter_page.dart';
import 'package:tourist_application/widgets/drawer_item.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('width $width, height $height');

    List<String> pagesNames = [
      'Categories',
      'Favorites',
    ];

    List<Widget> pages = [
      CategoryPage(),
      FavoritePage(),
    ];

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.amber,
                  width: double.infinity,
                  height: 120,
                  child: Center(
                    child: Text(
                      'Your Tourist Guide',
                      style: Get.theme.textTheme.headlineLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                  iconData: Icons.work_outline,
                  text: 'Trips',
                  onTap: () {
                    Get.offNamed(HomePage.id);
                  },
                ),
                DrawerItem(
                  iconData: Icons.filter_list_outlined,
                  text: 'Filter',
                  onTap: () {
                    Get.offNamed(FilterPage.id);
                  },
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: GetBuilder<HomeController>(
          builder: (container) => Text(
            pagesNames[container.pageIndex],
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => pages[controller.pageIndex],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => BottomNavigationBar(
          backgroundColor: main_color,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: controller.pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  print('home clicked');
                  controller.changeIndex();
                },
                child: const Icon(Icons.home),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  print('favorite clicked');
                  controller.changeIndex();
                },
                child: const Icon(Icons.favorite),
              ),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
