import 'package:flutter/material.dart';

class MyBottomBarContainer {

  ///调用函数
  getBottomNavigationBar(int currentIndex,DataColumnSortCallback callback) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text("首页"),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text("分类"),
          icon: Icon(Icons.menu),
        ),
        BottomNavigationBarItem(
          title: Text("购物车"),
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          title: Text("消息"),
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          title: Text("我的"),
          icon: Icon(Icons.person),
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.lightBlueAccent,
      showUnselectedLabels: true,
      onTap: (i){
        callback(i,false);
      },
    );
  }

}