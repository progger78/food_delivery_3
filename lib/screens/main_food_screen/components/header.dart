import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.height45,
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           AppBigText(text: 'Russia'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  AppSmallText(text: 'St-Petersburg'),
                  Padding(
                    padding: EdgeInsets.only(top: 3, right: 2),
                    child: Icon(Icons.arrow_drop_down_rounded),
                  )
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: Dimensions.height45,
            width: Dimensions.width45,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: Dimensions.height20,
            ),
          )
        ],
      ),
    );
  }
}
