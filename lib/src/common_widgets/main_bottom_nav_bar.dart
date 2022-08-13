import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainBottomNavBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;
  const MainBottomNavBar({Key? key, required this.onTap, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      onTap: onTap,
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Iconsax.home)),
        BottomNavigationBarItem(
            label: "Invoice", icon: Icon(Iconsax.bill)),
        BottomNavigationBarItem(
            label: "Clients", icon: Icon(Iconsax.people)),
        BottomNavigationBarItem(
            label: "Items", icon: Icon(Iconsax.receipt_item)),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Iconsax.setting),
        ),
      ],
    );
  }
}
