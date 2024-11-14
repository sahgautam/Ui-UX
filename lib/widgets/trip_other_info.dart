import 'package:flutter/material.dart';
import 'package:tourist_application/statics/static.dart';

class TripOtherInfo extends StatelessWidget {
  const TripOtherInfo({
    super.key,
    required this.tripListInfo,
    required this.isProgram,
  });

  final List<String> tripListInfo;
  final bool isProgram;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int day = 0;
    return Container(
      height: height / 5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          day += 1;
          return Container(
            padding: const EdgeInsets.only(right: 5,top: 5),
            child: Card(
              elevation: 0,
              child: Row(
                children: [
                  isProgram == true
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'يوم $day',
                              style: const TextStyle(
                                color: main_color,
                                fontFamily: 'ElMessiri',
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  isProgram == true
                      ? const SizedBox(
                          width: 10,
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: width / 1.5,
                    child: Text(
                      tripListInfo[index],
                      maxLines: 3,
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tripListInfo.length,
      ),
    );
  }
}
