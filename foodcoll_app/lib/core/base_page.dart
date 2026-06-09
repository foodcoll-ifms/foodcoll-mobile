import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final Widget body;
  final String title;
  final int currentIndex;
  final Function(int)? onTabChanged;
  final bool showBottomNavigation;

  const BasePage({
    Key? key,
    required this.body,
    required this.title,
    this.currentIndex = 0,
    this.onTabChanged,
    this.showBottomNavigation = true,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late int _selectedIndex;

  final Color iconColor = const Color(0xFFA8D5D4);
  final Color iconHoverColor = const Color(0xFF1FA7A6);
  final double iconSize = 24;
  final double labelFontSize = 12;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/favorites');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/settings');
        break;
    }
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: iconSize, color: iconColor),
      activeIcon: Icon(icon, size: iconSize, color: iconHoverColor),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: widget.body,
        ),
      ),
      bottomNavigationBar: widget.showBottomNavigation
          ? BottomNavigationBar(
              backgroundColor: backgroundColor,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                fontSize: labelFontSize,
                fontFamily: 'Inter',
                color: iconHoverColor,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: labelFontSize,
                fontFamily: 'Inter',
                color: iconColor,
              ),
              type: BottomNavigationBarType.fixed,
              iconSize: iconSize,
              items: [
                _buildNavItem(Icons.home, 'Home'),
                _buildNavItem(Icons.search, 'Buscar'),
                _buildNavItem(Icons.star, 'Favoritos'),
                _buildNavItem(Icons.settings, 'Configurações'),
              ],
            )
          : null,
    );
  }
}