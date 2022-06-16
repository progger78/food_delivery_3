import 'package:flutter/material.dart';
import 'package:food_delivery_3/models/products_model.dart';
import '/utils/utils.dart';
import '/widgets/app_big_text.dart';
import '/widgets/app_small_text.dart';

class BottomCardWithButns extends StatelessWidget {
  BottomCardWithButns(
      {Key? key,
      this.width,
      required this.isCounter,
      this.productQuantity = 0,
      this.productPrice = 18.9,
      this.popularProduct,
      this.recommendedProduct})
      : super(key: key);

  final double? width;
  int productQuantity;
  final bool isCounter;
  double? productPrice;
  ProductModel? popularProduct;
  ProductModel? recommendedProduct;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius40),
          topRight: Radius.circular(Dimensions.radius40),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: Dimensions.width20),
        child: Row(
          children: [
            Container(
              width: isCounter ? Dimensions.width45 * 3 : Dimensions.height70,
              height: Dimensions.height70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
              ),
              child: isCounter
                  ? Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              size: Dimensions.height20,
                            )),
                        AppBigText(
                          text: productQuantity.toString(),
                          size: Dimensions.font26,
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: Dimensions.height20,
                          ),
                        )
                      ],
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                height: Dimensions.height70,
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius20,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSmallText(
                        differSize: true,
                        text: isCounter ? '\$${popularProduct?.price!.toStringAsFixed(2)}' :  '\$${recommendedProduct?.price!.toStringAsFixed(2)}',
                        color: Colors.white,
                        size: Dimensions.font26 - 2,
                      ),
                      VerticalDivider(
                        thickness: 2,
                        endIndent: Dimensions.height20,
                        indent: Dimensions.height25,
                        color: Colors.white,
                      ),
                      AppSmallText(
                          differSize: true,
                          text: 'Add To Cart',
                          color: Colors.white,
                          size: Dimensions.font26 - 2)
                    ],
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
