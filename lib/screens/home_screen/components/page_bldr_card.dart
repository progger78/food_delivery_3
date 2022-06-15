import 'package:flutter/material.dart';

import '../../../models/products_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';


class PageBldrCard extends StatelessWidget {
  const PageBldrCard({
    Key? key, required this.popularProduct,
  }) : super(key: key);

  final ProductModel popularProduct;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
 
    return Container(
      height: size.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius20,
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          AppBigText(
                text: popularProduct.name!,
                color: Colors.black,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                padding: EdgeInsets.only(right: Dimensions.width10),
                child: StarsWithComments(popularProduct: popularProduct),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: Dimensions.height10,
                  top: Dimensions.height25,
                  right: Dimensions.width10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const IconWithText(
                      text: 'Normal',
                      icon: Icons.attach_money,
                      iconColor: AppColors.yelowColor,
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const IconWithText(
                      text: '1.5 km',
                      icon: Icons.location_on,
                      iconColor: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const IconWithText(
                      text: '30 min',
                      icon: Icons.watch_later,
                      iconColor: AppColors.slightPinkIcon,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

