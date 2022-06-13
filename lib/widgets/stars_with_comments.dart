import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class StarsWithComments extends StatelessWidget {
  const StarsWithComments({
    Key? key, this.gottenStars = 5,
  
  }) : super(key: key);
  
  final int gottenStars;
  

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Wrap(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: AppColors.mainColor,
              size: Dimensions.height20,
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        AppSmallText(
            text: '(${gottenStars.toStringAsFixed(1)})',
            color: AppColors.mainTextColor),
        SizedBox(
          width: Dimensions.width25,
        ),
        const AppSmallText(
          text: '1150 comments',
          color: AppColors.mainTextColor,
        )
      ],
    );
  }
}
