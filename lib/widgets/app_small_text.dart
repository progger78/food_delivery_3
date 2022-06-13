import 'package:flutter/material.dart';
import 'package:food_delivery_3/utils/configurations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/dimensions.dart';

class AppSmallText extends StatelessWidget {
  const AppSmallText({
    Key? key,
    required this.text,
    this.differSize = false,
    this.color = AppColors.mainTextColor,
    this.size, this.height = 1.6,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? size;
  final double height;
  final bool differSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: differSize ? size  : Dimensions.font16  ,
        color: color,
        height: height
      ),
    );
  }
}
