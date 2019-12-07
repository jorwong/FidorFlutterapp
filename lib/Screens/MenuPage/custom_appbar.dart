import 'package:flutter/material.dart';
import 'package:fidortry/Screens/MenuPage/utils.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  const CustomAppBar({Key key, this.isHome = true}) : super(key: key);
  @override
  Size get preferredSize => Size(null, 56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey,
      leading: IconButton(
        onPressed: () {
          if (!isHome) {
            Navigator.pop(context);
          }
        },
        icon: Icon(
          isHome ? LineIcons.bars : LineIcons.angle_left,
          color: Colors.white,
          size: 28.0,
        ),
      ),
      title: Text("Menu"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            LineIcons.shopping_cart,
            color: Colors.white,
            size: 30.0,
          ),
        )
      ],
    );
  }
}
