import 'package:flutter/material.dart';
import 'package:food_delivery_3/utils/utils.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {Key? key,
      required this.icon,
      this.backgorundColor = Colors.white54,
      this.iconColor = Colors.black})
      : super(key: key);

  final IconData icon;
  Color? backgorundColor;
  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.height45,
      width: Dimensions.width45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgorundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
