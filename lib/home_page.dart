import 'package:flutter/material.dart';
import 'package:shop_app_flutter/product_list.dart'; // siit võtab body
import 'package:shop_app_flutter/cart_page.dart'; // siit võtab body

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;

  List<Widget> pages = const [Productlist(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ), //currentPage == 0 ? Productlist() : CartPage(),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
          ]),
    );
  }
}
/*

*/