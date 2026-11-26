import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  // 定义数据 根据数据进行渲染4个导航
  // 一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/images/tabbar/icon-home.png",
      "active_icon": "lib/assets/images/tabbar-active_jiedian/icon-home.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/images/tabbar/icon-influencer.png",
      "active_icon":
          "lib/assets/images/tabbar-active_jiedian/icon-influencer.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/images/tabbar/icon-order.png",
      "active_icon": "lib/assets/images/tabbar-active_jiedian/icon-order.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/images/tabbar/icon-my.png",
      "active_icon": "lib/assets/images/tabbar-active_jiedian/icon-my.png",
      "text": "我的",
    },
  ];

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MyView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea 避开安全区
      body: SafeArea(child: IndexedStack(
        index: _currentIndex,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          print(index);
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
      ),
    );
  }
}
