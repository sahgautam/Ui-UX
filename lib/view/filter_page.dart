import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/controller/animation_controller.dart';
import 'package:tourist_application/controller/filtered_controller.dart';
import 'package:tourist_application/statics/static.dart';
import 'package:tourist_application/view/home_page.dart';
import 'package:tourist_application/widgets/drawer_item.dart';

class FilterPage extends StatelessWidget {
  static const String id = '/FilterPage';

  @override
  Widget build(BuildContext context) {
    FilteredController filteredController = Get.find<FilteredController>();
    AnimationsController animationsController = Get.put(AnimationsController());
    animationsController.animateFilters();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
        backgroundColor: main_color,
        foregroundColor: Colors.white,
        title: Text(
          'Filter Search',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GetBuilder<AnimationsController>(
            init: animationsController,
            builder: (animationsController) => GetBuilder<FilteredController>(
              init: filteredController,
              builder: (filteredController) => AnimatedPositioned(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                top: animationsController.isFilteredAnimated ? 10 : 100,
                child: SizedBox(
                  width: width - 10,
                  height: height / 10,
                  child: SwitchListTile(
                    title: const Text(
                      'Family Trips',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    subtitle: const Text(
                      'Show trips suitable for families',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onChanged: (value) {
                      filteredController.chanageValueForForFamily();
                    },
                    value: filteredController.isForFamily,
                    trackColor: WidgetStateProperty.resolveWith((state) {
                      if (state.contains(WidgetState.selected)) {
                        return main_color;
                      }
                      return null;
                    }),
                  ),
                ),
              ),
            ),
          ),
          GetBuilder<AnimationsController>(
            init: animationsController,
            builder: (animationsController) => GetBuilder<FilteredController>(
              init: filteredController,
              builder: (filteredController) => AnimatedPositioned(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                top: animationsController.isFilteredAnimated ? 60 : 150,
                child: SizedBox(
                  width: width - 10,
                  height: height / 10,
                  child: SwitchListTile(
                    title: const Text(
                      'Winter Trips',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    subtitle: const Text(
                      'Show trips in winter season',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onChanged: (value) {
                      filteredController.chanageValueForWinter();
                    },
                    value: filteredController.isWinter,
                    trackColor: WidgetStateProperty.resolveWith(
                      (state) {
                        if (state.contains(WidgetState.selected)) {
                          return main_color;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          GetBuilder<AnimationsController>(
            init: animationsController,
            builder: (animationsController) => GetBuilder<FilteredController>(
              init: filteredController,
              builder: (filteredController) => AnimatedPositioned(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                top: animationsController.isFilteredAnimated ? 110 : 200,
                child: SizedBox(
                  width: width - 10,
                  height: height / 10,
                  child: SwitchListTile(
                    title: const Text(
                      'Summer Trips',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    subtitle: const Text(
                      'Show trips in summer season',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onChanged: (value) {
                      filteredController.chanageValueForSummer();
                    },
                    value: filteredController.isSummer,
                    trackColor: WidgetStateProperty.resolveWith((state) {
                      if (state.contains(WidgetState.selected)) {
                        return main_color;
                      }
                      return null;
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
