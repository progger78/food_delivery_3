import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class PopularHeader extends StatelessWidget {
  const PopularHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: Dimensions.width15, top: Dimensions.height20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
     AppBigText(
            text: 'Popular',
            color: Colors.black,
          ),
          Container(padding: const EdgeInsets.only(top: 2),
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
