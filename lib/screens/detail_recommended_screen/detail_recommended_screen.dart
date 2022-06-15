import 'package:flutter/material.dart';
import '/utils/utils.dart';
import '/widgets/bottom_card_with_buttns.dart';
import '/widgets/widgets.dart';
import 'components/detail_popular_body.dart';

class DetailPopularScreen extends StatelessWidget {
  const DetailPopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DetailPopularBody(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: Dimensions.height70, 
          // padding: EdgeInsets.only(bottom: Dimensions.height5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgorundColor: AppColors.mainColor,
                ),
                AppBigText(isBigger: true, text: '\$${15.99}  X  ${0}', size: Dimensions.font22, color: Colors.black, fontWeight: FontWeight.w500,),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgorundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          BottomCardWithButns(isCounter: false)
        ],
      ),
    );
  }
}
