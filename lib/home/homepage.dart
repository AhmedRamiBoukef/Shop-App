import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/cart/cart.dart';

import 'widgets/categories.dart';
import 'widgets/newarrivals.dart';
import 'widgets/searchform.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide.none,
  );
  int _selectedItemPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.all(12),

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,

        ///configuration for SnakeNavigationBar.gradient
        //snakeViewGradient: selectedGradient,
        //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: false,
        showSelectedLabels: false,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() {
          _selectedItemPosition = index;
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed('/');
              break;
            case 1:
              Navigator.of(context).pushNamed(CartScreen.screenRoute);
              break;
            default:
          }
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'shopping_cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'person'),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: 8),
            Text(
              "15/2 New Texas",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                "best Outfits for you",
                style: TextStyle(fontSize: 18),
              ),
              SearchForm(outlineInputBorder: outlineInputBorder),
              Categories(),
              NewArrivals(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 30),
          DrawerElem(
            icon: Icons.favorite,
            title: "My favourites",
          ),
          DrawerElem(
            icon: Icons.wallet_outlined,
            title: "Wallets",
          ),
          DrawerElem(
            icon: Icons.local_mall,
            title: "My orders",
          ),
          DrawerElem(
            icon: Icons.feed_sharp,
            title: "About us",
          ),
          DrawerElem(
            icon: Icons.lock,
            title: "Privacy policy",
          ),
          DrawerElem(
            icon: Icons.settings,
            title: "Settings",
          ),
          SizedBox(height: 80),
          DrawerElem(
            icon: Icons.logout,
            title: "Logout",
          ),
        ],
      ),
    );
  }
}

class DrawerElem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerElem({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Color.fromARGB(55, 255, 153, 0),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Colors.orange[700],
        ),
      ),
      title: Text(title),
    );
  }
}
