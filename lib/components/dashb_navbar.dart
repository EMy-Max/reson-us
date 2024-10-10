import 'package:reservon/utilities/exports.dart';

class DashbNavbar extends StatefulWidget {
  const DashbNavbar({super.key});

  @override
  State<DashbNavbar> createState() => _DashbNavbarState();
}

class _DashbNavbarState extends State<DashbNavbar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [NavLabel(),NavLabel(),NavLabel(),NavLabel()],

    );
  }
}


class NavLabel extends StatefulWidget {
  const NavLabel({super.key});

  @override
  State<NavLabel> createState() => _NavLabelState();
}

class _NavLabelState extends State<NavLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.space_dashboard_outlined),
        Text('Dashboard')
      ],
    );
  }
}
