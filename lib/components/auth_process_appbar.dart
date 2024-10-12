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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BrandLogoNameTag(),
          Row(
            children: [
              Icon(Icons.language,
                  color: AppColors.secondaryColor, size: 20), // Added globe icon
              SizedBox(width: 4),
              Text('EN', style: TextStyle(color: AppColors.secondaryColor)),
              Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.secondaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
