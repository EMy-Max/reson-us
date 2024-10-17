import 'package:reservon/utilities/exports.dart';

class ScheduleActive extends StatefulWidget {
  const ScheduleActive({super.key});

  @override
  State<ScheduleActive> createState() => _ScheduleActiveState();
}

class _ScheduleActiveState extends State<ScheduleActive> {
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
              DecoratedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppText.schedulingSubText,
                          style: TextStyle(
                            color: AppColors.grey3,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacer(),
                        AuthNavButton(buttonChild: Icon(Icons.calendar_today_outlined, color: Colors.white,), onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CreateSchedule(); // Your modal widget
                            },
                          );
                        },)
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
              DecoratedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.customerTimeline, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    CustomerTimeline(
                        bookings: [
                      CustomerBooking(
                      customerName: 'Ade Daniel',
                      phoneNumber: '07018860969',
                      serviceType: 'Development',
                      startTime: '10:45am',
                      endTime: '11:45am',
                      duration: '1hr',
                      status: 'Done',
                      customerImageUrl: 'https://example.com/avatar1.jpg',
                    ),
                      CustomerBooking(
                        customerName: 'Ade Daniel',
                        phoneNumber: '07018860969',
                        serviceType: 'Development',
                        startTime: '10:45am',
                        endTime: '11:45am',
                        duration: '1hr',
                        status: 'Done',
                        customerImageUrl: 'https://example.com/avatar1.jpg',
                      ),
                      CustomerBooking(
                        customerName: 'Ade Daniel',
                        phoneNumber: '07018860969',
                        serviceType: 'Development',
                        startTime: '10:45am',
                        endTime: '11:45am',
                        duration: '1hr',
                        status: 'Done',
                        customerImageUrl: 'https://example.com/avatar1.jpg',
                      ),
                      CustomerBooking(
                        customerName: 'Ade Daniel',
                        phoneNumber: '07018860969',
                        serviceType: 'Development',
                        startTime: '10:45am',
                        endTime: '11:45am',
                        duration: '1hr',
                        status: 'Done',
                        customerImageUrl: 'https://example.com/avatar1.jpg',
                      ),]),
                  ],
                ),
              )
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



//DECORATED CONTAINER
class DecoratedContainer extends StatelessWidget {
  final Widget child;
  String? height;
   DecoratedContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.8,
              blurRadius: 1.5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
    child: child
    );
  }
}
