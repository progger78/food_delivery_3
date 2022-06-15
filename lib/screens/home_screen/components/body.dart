import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';
import '/controllers/popular_product_controller.dart';
import '/controllers/recommended_product_controller.dart';
import '/models/products_model.dart';
import 'package:get/get.dart';

import '/widgets/widgets.dart';
import '/utils/utils.dart';
import 'header.dart';
import 'page_bldr_card.dart';
import 'recommended_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(),
        Expanded(
          child: SingleChildScrollView(
            child: FoodPageBody(),
          ),
        ),
      ],
    );
  }
}

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = Dimensions.screenHeight * 0.4;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? SizedBox(
                  height: size.height * 0.4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: popularProduct.popularProductList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _buildPageBuilder(
                        size, index, popularProduct.popularProductList[index]),
                  ),
                )
              : const CircularProgressIndicator();
        }),
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(Dimensions.height10 + 1),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        const RecommendedHeader(),
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return !recommendedProduct.isLoaded ? CircularProgressIndicator() : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: Dimensions.height10,
                        ),
                        height: Dimensions.height70 * 2,
                        width: Dimensions.height70 * 2,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${AppConstants.baseUrl}/uploads/${recommendedProduct.recommendedProductList[index].img!}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: Dimensions.height10),
                          height: Dimensions.height80 + 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Colors.black12,
                                  blurRadius: 5),
                            ],
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Dimensions.radius15 - 5),
                              bottomRight: Radius.circular(
                                Dimensions.radius15 - 5,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width5,
                                right: Dimensions.width5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppBigText(
                                  text: recommendedProduct
                                      .recommendedProductList[index].name,
                                  color: Colors.black,
                                ),
                                const AppSmallText(
                                  text: 'Top and juicy dessert taste',
                                  color: AppColors.mainTextColor,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: Dimensions.width5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconWithText(
                                        text: 'Normal',
                                        icon: Icons.attach_money,
                                        iconColor: AppColors.yelowColor,
                                      ),
                                      IconWithText(
                                        text: '1.5 km',
                                        icon: Icons.location_on,
                                        iconColor: AppColors.mainColor,
                                      ),
                                      IconWithText(
                                        text: '30 min',
                                        icon: Icons.watch_later,
                                        iconColor: AppColors.slightPinkIcon,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageBuilder(Size size, int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2.5;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2.5;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2.5;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2.5, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.4,
            width: size.width,
          ),
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height15,
                right: Dimensions.width10,
                left: Dimensions.width10),
            height: size.height * 0.27,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '${AppConstants.baseUrl}/uploads/${popularProduct.img!}'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(
                Dimensions.radius25,
              ),
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            left: size.width * 0.07,
            child: PageBldrCard(popularProduct: popularProduct),
          )
        ],
      ),
    );
  }
}
