import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          selectedItemColor: Colors.blueGrey,
          onTap: _onTap,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 3,
          selectedIconTheme: const IconThemeData(color: Colors.teal),
          selectedLabelStyle: const TextStyle(color: Colors.teal),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_outlined), label: 'Karakterler'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: 'Lokasyonlar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined), label: 'Bölümler'),
          ],
        ),
      ),
    );
  }
}
