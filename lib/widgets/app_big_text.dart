import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class AppBigText extends StatelessWidget {
  AppBigText(
      {Key? key,
      required this.text,
      this.isBigger = false,
      this.color = AppColors.mainColor,
      this.size,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  final String text;
  final Color? color;
   double? size;
  final TextOverflow overflow;
  bool isBigger;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      style: GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        fontSize: isBigger ? Dimensions.font30 : size,
        color: color
      ),
      overflow: overflow,
    );
  }
}