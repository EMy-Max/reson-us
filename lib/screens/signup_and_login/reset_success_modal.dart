import 'package:reservon/utilities/exports.dart';


class ResetSuccessModal extends StatelessWidget {
  final VoidCallback onOkPressed ;

  const ResetSuccessModal({super.key, required this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 24.w),
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(image: AssetImage('images/Featured success icon.png')),
                  Container(
                    alignment: Alignment.center,
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      color: Color(0XFFEEF1F3),
                      shape: BoxShape.circle,
                    ),
                    child: const Text('X', style: TextStyle(color: Colors.black,),)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(24.sp,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Success',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const Text(
                    'Your password has been changed successfully.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.grey3,
                    ),
                  ),
                  SizedBox(height: 48.h,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      onOkPressed();
                    },
                    child: Container(
                      width: 280.w,
                      height: 38.h,
                      // padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(32.r)
                      ),
                      child: const Text(
                        'Ok',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

