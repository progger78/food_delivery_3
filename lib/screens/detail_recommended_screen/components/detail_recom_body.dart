import 'package:flutter/material.dart';

import '/utils/utils.dart';


import '../../../widgets/widgets.dart';

class DetailRecomBody extends StatelessWidget {
  const DetailRecomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height45 + 5,
                  left: Dimensions.width25,
                  right: Dimensions.width25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back),
                  AppIcon(icon: Icons.shopping_cart)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius40),
                  topRight: Radius.circular(Dimensions.radius40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width25,
                    right: Dimensions.width25,
                    top: Dimensions.height25,
                    bottom: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBigText(
                      isBigger: true,
                      text: 'Chinese Theme',
                      color: Colors.black,
                      size: Dimensions.font22,
                    ),
                    SizedBox(height: Dimensions.height15),
                    const StarsWithComments(),
                    SizedBox(height: Dimensions.height25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWithText(
                          text: 'Normal',
                          icon: Icons.attach_money,
                          iconColor: AppColors.yelowColor,
                          iconSize: Dimensions.height25 + 5,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconWithText(
                          text: '1.5 km',
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          iconSize: Dimensions.height25 + 5,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconWithText(
                          text: '30 min',
                          icon: Icons.watch_later,
                          iconColor: AppColors.slightPinkIcon,
                          iconSize: Dimensions.height25 + 5,
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height15),
                    AppBigText(
                      text: 'Introduce',
                      size: Dimensions.font26,
                      color: Colors.black,
                    ),
                    SizedBox(height: Dimensions.height10),
                    Expanded(
                      child: const SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                'Средняя скорость печати составляет всего 207 знаков в минуту. Чтобы улучшить навыки набора текста и научиться печатать, как профессионал, нужно постоянно тренироватьсяЗапомни: практика, практика и еще раз практика. Исследования показали, что постоянная практика помогает превысить средний показатель скорости печати в три раза. Проверить скорость печати онлайн ты можешь вместе с Ratatype.'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
