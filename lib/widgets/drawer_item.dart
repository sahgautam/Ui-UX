import 'package:flutter/material.dart';
import 'package:tourist_application/statics/static.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  IconData iconData;
  String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(
        iconData,
        color: main_color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black, // 0xfff1c8aec
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width / 19,
        ),
      ),
    );
  }
}
