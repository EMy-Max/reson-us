import 'package:flutter/cupertino.dart';
import 'package:reservon/utilities/exports.dart';


class DashbNavbar extends StatefulWidget {
  const DashbNavbar({super.key});

  @override
  State<DashbNavbar> createState() => _DashbNavbarState();
}

class _DashbNavbarState extends State<DashbNavbar> {
  int selectedIndex = 0; // Track the currently selected index

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
    // You can add navigation logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grey3,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.space_dashboard_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_calendar_outlined),
          label: 'Scheduling',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.tag),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Booking site',
        ),
      ],
    );
  }
}