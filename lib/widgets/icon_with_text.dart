

import 'package:flutter/material.dart';
import 'package:food_delivery_3/utils/utils.dart';
import 'package:food_delivery_3/widgets/app_small_text.dart';

class IconWithText extends StatelessWidget {
  const IconWithText(
      {Key? key, required this.text, required this.icon, this.iconSize, required this.iconColor, })
      : super(key: key);

  final String text;
  final IconData icon;
  final double? iconSize;
  final Color iconColor;
 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        
        
        AppSmallText(
          text: text,
        ),
      ],
    );
  }
}
