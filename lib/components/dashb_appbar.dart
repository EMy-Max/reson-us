import 'package:reservon/utilities/exports.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const DashboardAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.notifications_none, color: Colors.black),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          onPressed: () {
            // Handle notification tap
          },
        ),
        UserDropdown(name: 'John Adewale', email: 'odeniyi123@gmail.com', imageUrl: '',),
        SizedBox(width: 8),
        LanguageDropdown(),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      offset: Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Text('EN', style: TextStyle(color: Colors.black)),
          Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'EN',
          child: Text('English'),
        ),
        PopupMenuItem<String>(
          value: 'FR',
          child: Text('Français'),
        ),
        PopupMenuItem<String>(
          value: 'DE',
          child: Text('Deutsch'),
        ),
        // Add more language options as needed
      ],
      onSelected: (String value) {
        // Handle language selection
        print('Selected language: $value');
      },
    );
  }
}


class UserDropdown extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const UserDropdown({
    Key? key,
    required this.name,
    required this.email,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      offset: Offset(0, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 15,
          ),
          Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        email,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'profile',
          child: Text('My profile'),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'product_switch',
          child: Text('Product switch:'),
        ),
        PopupMenuItem<String>(
          value: 'scheduling_app',
          child: Text('Scheduling app'),
        ),
        PopupMenuItem<String>(
          value: 'invoicing_app',
          child: Text('Invoicing app'),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'logout',
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle selection
        switch (value) {
          case 'profile':
            print('Navigate to profile');
            break;
          case 'product_switch':
            print('Handle product switch');
            break;
          case 'logout':
            print('Perform logout');
            break;
        }
      },
    );
  }
}

