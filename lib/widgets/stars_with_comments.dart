import 'package:flutter/material.dart';
import 'package:food_delivery_3/models/products_model.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class StarsWithComments extends StatelessWidget {
  const StarsWithComments({
    Key? key, this.popularProduct, 
  
  }) : super(key: key);
  
  final ProductModel? popularProduct;
  

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Wrap(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: (popularProduct?.stars)! > index ? AppColors.mainColor : Colors.grey,
              size: Dimensions.height20,
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        AppSmallText(
            text: '(${popularProduct?.stars!.toStringAsFixed(1)})',
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
