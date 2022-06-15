import 'package:flutter/material.dart';
import 'package:food_delivery_3/widgets/bottom_card_with_buttns.dart';

import 'components/detail_popular_body.dart';

class DetailRecommendedScreen extends StatelessWidget {
  const DetailRecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DetailRecomBody(),
      bottomNavigationBar: BottomCardWithButns(isCounter: true),
    );
  }
}
