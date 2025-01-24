import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourist_application/model/category.dart';
import 'package:tourist_application/statics/static.dart';
import 'package:tourist_application/view/category_trips_page.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // 411.42857142857144 ,, 866.2857142857143
    // 182 , 208
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            CategoryTripsPage.id,
            arguments: [
              category.id,
              category.title,
            ],
          );
        },
        splashColor: main_color,
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                category.imageUrl,
                width: width / 2.10,
                height: 230,
                loadingBuilder: (context, child, loadingProgress) {
                  // Check if the image is still loading
                  if (loadingProgress == null) {
                    print('loading progress ended');
                    return child;
                  } else {
                    print('loading progress');
                    // Image is loading, show thumbnail or placeholder
                    return Image.asset(
                      'assets/images/image_thumbnail.png',
                      width: width / 2.10,
                      height: 230,
                      fit: BoxFit.cover,
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/image_thumbnail.png',
                    width: width / 2.10,
                    height: 230,
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: width / 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
