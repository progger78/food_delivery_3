import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_3/screens/main_food_screen/main_food_screen.dart';
import 'package:food_delivery_3/utils/configurations.dart';
import 'package:food_delivery_3/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  late PersistentTabController _controller;
  List pages = [];

  void selectePage(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  List<Widget> _buildScreens() {
    return [
      const MainFoodScreen(),
      Center(child: Icon(Icons.search)),
      Center(child: Icon(Icons.work)),
      Center(child: Icon(Icons.sunny))
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("Archive"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(color: Colors.black)
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_selectedIndex],
//       bottomNavigationBar:
//       BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           unselectedItemColor: Colors.black,
//           selectedItemColor: AppColors.mainColor,
//           onTap: selectePage,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home_outlined,
//                 ),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.archive,
//                 ),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                 ),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.person,
//                 ),
//                 label: 'Home'),
//           ]),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      
      context,
      
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style11, // Choose the nav bar style with this property.
    );
  }
}
