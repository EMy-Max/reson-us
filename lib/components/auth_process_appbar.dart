import 'package:reservon/utilities/exports.dart';

class AuthProcessAppBar extends StatelessWidget {
  const AuthProcessAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BrandLogoNameTag(),
          Row(
            children: [
              Icon(Icons.language,
                  color: secondaryColor, size: 20), // Added globe icon
              const SizedBox(width: 4),
              Text('EN', style: TextStyle(color: secondaryColor)),
              Icon(Icons.keyboard_arrow_down_rounded, color: secondaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
