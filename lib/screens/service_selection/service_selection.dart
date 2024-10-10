import 'package:reservon/utilities/exports.dart';

class ServiceSelection extends StatefulWidget {
  const ServiceSelection({super.key});

  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  bool isSchedulingSelected = false;
  bool isInvoicingSelected = false;
  List<bool> isBasicSelected = [false, false];
  List<bool> isPremiumSelected = [false, false];

  bool get isAnyServiceSelected => isSchedulingSelected || isInvoicingSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthProcessAppBar(),
                SizedBox(height: 20.h),
                _buildHeader(),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  padding: EdgeInsets.all(0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildServiceCard('Scheduling service', isSchedulingSelected, (value) {
                        setState(() {
                          isSchedulingSelected = value;
                        });
                      }, 0),
                      _buildServiceCard('Invoicing service', isInvoicingSelected, (value) {
                        setState(() {
                          isInvoicingSelected = value;
                        });
                      }, 1),
                      SizedBox(height: 5.h),
                      _buildContinueButton(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: ElevatedButton(
        onPressed: isAnyServiceSelected ? () {
          // Trigger the dialog to open
          showPlanConfirmationDialog(context);
        }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isAnyServiceSelected ? Colors.blue : grey2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.h),
          ),
          minimumSize: Size(double.infinity, 50.h),
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void showPlanConfirmationDialog(BuildContext context) {
    List<ServicePlan> selectedPlans = [];

    if (isSchedulingSelected) {
      selectedPlans.add(ServicePlan(
        serviceName: 'Scheduling service',
        planType: isBasicSelected[0] ? 'Basic' : 'Premium',
        price: isBasicSelected[0] ? 0 : 50000,
      ));
    }
    if (isInvoicingSelected) {
      selectedPlans.add(ServicePlan(
        serviceName: 'Invoicing service',
        planType: isBasicSelected[1] ? 'Basic' : 'Premium',
        price: isBasicSelected[1] ? 0 : 50000,
      ));
    }

    final total = selectedPlans.fold(0.0, (sum, plan) => sum + plan.price);

    showDialog(
      context: context,
      builder: (context) => PlanConfirmationDialog(
        selectedPlans: selectedPlans,
        total: total,
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Services plans',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          Text(
            'Select your preferred plan from one or both of the services to land on your dashboard',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, bool isSelected, Function(bool) onSelected, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0B3558),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
            ),
            padding: EdgeInsets.all(10.h),
            width: double.infinity,
            child: Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
            color: Colors.white,
            child: SizedBox(
              height: 500.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, planIndex) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: _buildPlanCard(
                      planIndex == 0 ? 'Basic' : 'Premium',
                      planIndex == 0 ? isBasicSelected[index] : isPremiumSelected[index],
                          (value) {
                        setState(() {
                          if (planIndex == 0) {
                            isBasicSelected[index] = value;
                            isPremiumSelected[index] = false;
                          } else {
                            isPremiumSelected[index] = value;
                            isBasicSelected[index] = false;
                          }

                          if (index == 0) {
                            isSchedulingSelected = value;
                          } else {
                            isInvoicingSelected = value;
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(String planType, bool isSelected, Function(bool) onSelected) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEEF4FE) : grey1,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFCCE0FD) : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFAE199) : grey1,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(7.w),
                      child: Text(
                        planType,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.black : Colors.grey[600],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onSelected(!isSelected);
                      },
                      child: Icon(
                        Icons.check_circle,
                        size: 24,
                        color: isSelected ? Colors.blue : Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFFEFAEE),
                          child: Text(
                            '₦',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFFF4B402),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          planType == 'Basic' ? '0  ' : '50,000 ',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            planType == 'Basic' ? 'For 20 schedules' : 'Per Month',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: grey3,
                            )
                        ),
                      ],
                    ),
                    Divider(
                      color: grey2,
                      thickness: 1,
                      height: 20,
                    ),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum dolor lorem', true),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum dolor lorem', true),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum dolor', true),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum', planType == 'Premium'),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum dolor lorem', planType == 'Premium'),
                    SizedBox(height: 10.h),
                    _buildFeatureItem('Lorem ipsum dolor lorem', planType == 'Premium'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isIncluded) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Icon(
            isIncluded ? Icons.check : Icons.close,
            color: isIncluded ? Colors.blue : Colors.red,
            size: 20.sp,
          ),
          SizedBox(width: 10.w),
          Text(text, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
