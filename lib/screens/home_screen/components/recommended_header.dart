import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class RecommendedHeader extends StatelessWidget {
  const RecommendedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width15, top: Dimensions.height20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBigText(
            text: 'Recommended',
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 2),
            child: const AppSmallText(
              text: '  •  Food Pairing',
              color: AppColors.mainTextColor,
            ),
          )
        ],
      ),
    );
  }
}
