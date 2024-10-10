import 'package:reservon/utilities/exports.dart';

class PlanConfirmationDialog extends StatelessWidget {
  final List<ServicePlan> selectedPlans;
  final double total;

  const PlanConfirmationDialog({
    super.key,
    required this.selectedPlans,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 500.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Confirm selected plans',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEEF1F3),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 18.r,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...selectedPlans.map((plan) => _buildPlanItem(plan)),
                    Divider(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16.r,
                              backgroundColor: const Color(0xFFFEFAEE),
                              child: Text(
                                '₦',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: const Color(0xFFF4B402),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              ' ${total.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFFEEF4FE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: const Color(0xFF0051C4),
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Extracting the first word of each service name and combining with planType
                              List<String> subscribedServices = selectedPlans.map((plan) {
                                String firstWord = plan.serviceName.split(' ')[0];
                                return '$firstWord ${plan.planType}';
                              }).toList();

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return SuccessDialog(
                                    subscribedServices: subscribedServices,
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            child: Text(
                              'Yes, pay now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanItem(ServicePlan plan) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plan.serviceName, style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAE199),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      plan.planType,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: const Color(0xFFFEFAEE),
                    child: Text(
                      '₦',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: const Color(0xFFF4B402),
                      ),
                    ),
                  ),
                  Text(
                    plan.planType == 'Basic'
                        ? '0'
                        : ' ${plan.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    plan.planType == 'Basic' ? ' For 20 schedules' : ' Per Month',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
class ServicePlan {
  final String serviceName;
  final String planType;
  final double price;

  ServicePlan({
    required this.serviceName,
    required this.planType,
    required this.price,
  });
}
