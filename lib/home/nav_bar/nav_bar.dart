import 'package:flutter/material.dart';

import 'nav_bar_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.current,
    required this.switchTo,
    super.key,
  });

  final int current;
  final void Function(int) switchTo;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 8,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      enableFeedback: true,
      currentIndex: current,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 4,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            color: current == 0 ? Colors.green : Colors.black,
            icon: Icons.table_bar,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            icon: Icons.notes,
            color: current == 1 ? Colors.green : Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: NavBarItem(
            icon: Icons.video_collection,
            color: current == 2 ? Colors.green : Colors.black,
          ),
        ),
      ],
      onTap: (index) async {
        switchTo(index);
      },
    );
  }
}
