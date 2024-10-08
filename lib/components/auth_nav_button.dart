import 'package:reservon/utilities/exports.dart';



class AuthNavButton extends StatelessWidget {
  final String buttonText; // Text to display on the button
  final VoidCallback onTap; // Function to call on tap

  const AuthNavButton({
    Key? key,
    required this.buttonText, // Make buttonText required
    required this.onTap, // Make onTap required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the passed onTap function
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Text(
          buttonText, // Use the passed button text
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

