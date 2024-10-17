import 'package:reservon/utilities/exports.dart';

class SchedulingZeroScreen extends StatefulWidget {
  const SchedulingZeroScreen({super.key});

  @override
  State<SchedulingZeroScreen> createState() => _SchedulingZeroScreenState();
}

class _SchedulingZeroScreenState extends State<SchedulingZeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DashboardAppBar(title: 'Scheduling',),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointments section
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 0.5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.schedulingSubText,
                      style: TextStyle(
                        color: AppColors.grey3,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      height: 300.h,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey2.withOpacity(0.5), // Color of the shadow with opacity
                            spreadRadius: 1.sp, // How far the shadow spreads
                            blurRadius: 2.r, // How blurry the shadow is
                            offset: Offset(0, 3), // Offset in the x and y direction
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppointmentCard(
                                            title: 'Total Appointments',
                                            count: 0,
                                            subtitle: 'Today',
                                            color: Color(0xFFEEF4FE),
                                            textColor: AppColors.primaryColor,
                                            textBoxColor: Color(0xFFCCE0FD),
                                          ),
                                SizedBox(width: 8.w),
                                AppointmentCard(
                                            title: 'Upcoming',
                                            count: 0,
                                            subtitle: 'Today',
                                            color: Color(0xFFFEFAEE),
                                            textColor: Color(0xFF926C01),
                                            textBoxColor: Color(0xFFFCF0CC),
                                          ),
                                SizedBox(width: 8.w),
                                AppointmentCard(
                                            title: 'Done',
                                            count: 0,
                                            subtitle: 'Today',
                                            color: Color(0xFFF0F9F4),
                                            textColor: Color(0xFF1C8A4C),
                                            textBoxColor: Color(0xFFD3EEDF),
                                          ),
                                SizedBox(width: 8.w),
                              ],
                            ),
                            Row(
                              children: [
                                AppointmentCard(
                                                    title: 'Canceled',
                                                    count: 0,
                                                    subtitle: 'Today',
                                                    color: Color(0xFFFEF1E8),
                                                    textColor: Color(0xFFB51D15),
                                                    textBoxColor: Color(0xFFFCE4D1),
                                                  ),
                                SizedBox(width: 8.w),
                                AppointmentCard(
                                                    title: 'No show',
                                                    count: 0,
                                                    subtitle: 'Today',
                                                    color: Color(0xFFEEF1F3),
                                                    textColor: Color(0xFF04111D),
                                                    textBoxColor: Color(0xFFCED6DD),
                                                  ),
                                SizedBox(width: 8.w),
                              ],
                            )
                          ],
                        ),
                      )




                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ScheduleEmpty()
            ],
          ),
        ),
      ),
      bottomNavigationBar: DashbNavbar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0XFF0B3558),
        elevation: 10,
        isExtended: true,
        child: Icon(Icons.more_vert_outlined, size: 24.sp, color: Colors.white,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ScheduleEmpty extends StatelessWidget {
  const ScheduleEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("images/schedule 0.png")),
          SizedBox(height: 30.h,),
          Text(AppText.ScheduleZeroText, textAlign: TextAlign.center,),
          SizedBox(height: 40.h,),
          ScheduleAppointmentButton()
        ],
      ),
    );
  }
}



