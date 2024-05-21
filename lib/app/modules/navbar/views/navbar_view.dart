
import 'package:flutter/material.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/home/views/home_view.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/profil/views/profil_view.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';



class NavbarView extends StatefulWidget {
  const NavbarView({super.key, required this.title});

  final String title;

  @override
  State<NavbarView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavbarView> {

  List<FloatingBottomNavItem> bottomNavItems = const [
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.home,color: Colors.black,size: 30,),
      activeIcon: Icon(Icons.home,size: 30,),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.person,color: Colors.black,size: 30,),
      activeIcon: Icon(Icons.person,size: 30,),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.notifications,color: Colors.black,size: 25,),
      activeIcon: Icon(Icons.notifications,size: 25,),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.settings,color: Colors.black,size: 25,),
      activeIcon: Icon(Icons.settings,size: 25,),
    ),
  ];

  List<Widget> pages = [
    Container(
      child: HomeView(),
    ),
    Container(
      child: ProfilView(),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      pages: pages,
      items: bottomNavItems,
      initialPageIndex: 0,
      backgroundColor: Color(0xffD9D9D9),
      bottomPadding:0,
      elevation: 0,
      radius: 35,
      width: double.maxFinite,
      height: 60,
    );
  }
}