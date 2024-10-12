import 'package:reservon/utilities/exports.dart';

class BrandLogoNameTag extends StatelessWidget {
  const BrandLogoNameTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Image(image:AssetImage('images/logo.png')),
        SizedBox(width: 8),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brandName,
              style: TextStyle(
                fontSize: 35,
                height:0.8,
                letterSpacing: 2.0,
                // fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              brandTag,
              style: TextStyle(
                fontSize: 10,
                // fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
