import 'package:flutter/material.dart';
import 'package:food_delivery_3/utils/utils.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.icon}) : super(key: key);
  

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.height45,
      width: Dimensions.width45,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white54,),
      
      child: Icon(icon, color: Colors.black,),
    );
  }
}
