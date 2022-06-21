import 'package:flutter/material.dart';

import 'components/body.dart';

class MainFoodScreen extends StatelessWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
