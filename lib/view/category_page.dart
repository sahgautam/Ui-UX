
import 'package:flutter/material.dart';
import 'package:tourist_application/model/app_data.dart';
import 'package:tourist_application/widgets/category_item.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: width / 2.25,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CategoryWidget(
        Categories_data[index],
      ),
      itemCount: Categories_data.length,
    );
  }
}
