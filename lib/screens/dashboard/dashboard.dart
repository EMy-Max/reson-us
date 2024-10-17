import 'package:reservon/utilities/exports.dart';

class CombinedDashboardScreen extends StatefulWidget {
  const CombinedDashboardScreen({super.key});

  @override
  CombinedDashboardScreenState createState() => CombinedDashboardScreenState();
}

class CombinedDashboardScreenState extends State<CombinedDashboardScreen> {
  String selectedPeriod = 'Annually';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DashboardAppBar(title: 'Dashboard',),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointments section
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            'Appointments',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 260.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 400.w,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: AppointmentCard(
                                          title: 'Upcoming',
                                          count: 12,
                                          subtitle: 'Today',
                                          color: Color(0xFFFEFAEE),
                                          textColor: Color(0xFF926C01),
                                          textBoxColor: Color(0xFFFCF0CC),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      const Expanded(
                                        child: AppointmentCard(
                                          title: 'Done',
                                          count: 8,
                                          subtitle: 'Today',
                                          color: Color(0xFFF0F9F4),
                                          textColor: Color(0xFF1C8A4C),
                                          textBoxColor: Color(0xFFD3EEDF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: AppointmentCard(
                                          title: 'Canceled',
                                          count: 8,
                                          subtitle: 'Today',
                                          color: Color(0xFFFEF1E8),
                                          textColor: Color(0xFFB51D15),
                                          textBoxColor: Color(0xFFFCE4D1),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      const Expanded(
                                        child: AppointmentCard(
                                          title: 'No show',
                                          count: 2,
                                          subtitle: 'Today',
                                          color: Color(0xFFEEF1F3),
                                          textColor: Color(0xFF04111D),
                                          textBoxColor: Color(0xFFCED6DD),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Schedule flow section
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            'Schedule flow',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PeriodToggleButtons(
                          selectedPeriod: selectedPeriod,
                          onPeriodChanged: (period) {
                            setState(() {
                              selectedPeriod = period;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 300.w,
                          height: 200.h,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0, bottom: 3.0),
                            child: ScheduleLineChart(selectedPeriod: selectedPeriod),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Most booked service section
              Container(
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
                child: const MostBookedServiceChart(),
              ),
              SizedBox(height: 20.h),

              // Customer Timeline section
              Container(
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
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Customer timeline',
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Today',
                              style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      CustomerTimeline(bookings: [
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
                      ]),
                    ],
                  ),
                ),
              ),
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



//////////////SCHEDULE FLOW///////////////////
class ScheduleLineChart extends StatelessWidget {
  final String selectedPeriod;

  const ScheduleLineChart({super.key, required this.selectedPeriod});

  List<FlSpot> generateData() {
    final random = Random();
    List<FlSpot> spots = [];
    int dataPoints;

    switch (selectedPeriod) {
      case 'Daily':
        dataPoints = 30;
        break;
      case 'Weekly':
        dataPoints = 52;
        break;
      case 'Annually':
      default:
        dataPoints = 12;
        break;
    }

    for (int i = 0; i < dataPoints; i++) {
      double y = random.nextDouble() * 3 + 1;
      spots.add(FlSpot(i.toDouble(), y));
    }

    return spots;
  }

  String getXAxisLabel(double value) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    switch (selectedPeriod) {
      case 'Daily':
        return '${value.toInt() + 1}';
      case 'Weekly':
        return 'W${value.toInt() + 1}';
      case 'Annually':
      default:
        return months[value.toInt() % 12];
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = generateData();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SizedBox(
          height: 300.h,
          width: max(MediaQuery.of(context).size.width, data.length * 50.w), // Use .w for width calculation
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey[300],
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30.w, // Use .w for reserved size
                    getTitlesWidget: (value, meta) {
                      // Only show labels for whole numbers and skip -0.1 and 5.1
                      if (value % 1 == 0 && value >= 0 && value <= 5) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h, left: 0, bottom: 0, right: 16.w), // Use .h and .w for padding
                            child: Text(
                              value == 0 ? '0' : '${value.toInt()}k',
                              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp), // Use .sp for font size
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink(); // Hide labels for non-whole numbers
                    },
                    interval: 1,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30.h,
                    getTitlesWidget: (value, meta) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h, left: 16.w, bottom: 0, right: 8.w), // Use .h and .w for padding
                          child: Text(
                            getXAxisLabel(value),
                            style: TextStyle(color: Colors.grey[600], fontSize: 12.sp), // Use .sp for font size
                          ),
                        ),
                      );
                    },
                    interval: 1,
                  ),
                ),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: data,
                  isCurved: true,
                  color: const Color(0xFF0051C4),
                  barWidth: 1,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0x550051C4),
                        Color(0x550051C4),
                        Color(0x55FFFFFF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  // tooltipBgColor: const Color(0xFF0B3558),
                  tooltipMargin: 10, // Adjust this value for spacing from the touch point
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    return touchedBarSpots.map((barSpot) {
                      return LineTooltipItem(
                        '${(barSpot.y * 1000).toStringAsFixed(0)}\n schedules',
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp, // Use .sp for font size
                          height: 1,
                        ),
                      );
                    }).toList();
                  },
                  tooltipPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h), // Use .h and .w for padding
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                ),
                touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  // You can add custom touch handling here if needed
                },
                handleBuiltInTouches: true,
              ),
              minX: 0,
              maxX: data.length.toDouble() - 1,
              minY: -0.1,
              maxY: 5.1,
            ),
          ),
        ),
      ),
    );
  }
}

class PeriodToggleButtons extends StatelessWidget {
  final String selectedPeriod;
  final Function(String) onPeriodChanged;

  const PeriodToggleButtons({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h, // Use .h for height
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1F3),
        borderRadius: BorderRadius.circular(32.r), // Use .r for border radius
      ),
      padding: EdgeInsets.all(4.h), // Use .h for padding
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: ['Daily', 'Weekly', 'Annually'].map((period) {
          final isSelected = selectedPeriod == period;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w), // Use .w for padding
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? const Color(0xFF0051C4) : Colors.transparent,
                foregroundColor: isSelected ? Colors.white : const Color(0xFF667085),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.r), // Use .r for border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h), // Use .w and .h for padding
              ),
              onPressed: () => onPeriodChanged(period),
              child: Text(
                period,
                style: TextStyle(fontSize: 12.sp), // Use .sp for font size
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/////////////MOST BOOKED SERVICE//////////////
class MostBookedServiceChart extends StatelessWidget {
  const MostBookedServiceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most booked service',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Text(
                  'In the last 30 days',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container for "Development: 300"
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, top: 20.h), // Use .h and .w for padding
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h), // Use .h and .w for padding
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Development: ',
                    style: TextStyle(
                        color: AppColors.grey3,
                        fontSize: 12.sp
                    ),
                  ),
                  Text(
                    '300',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, right: 16.w, left: 16.w, top: 0.h),
          child: SizedBox(
            height: 200.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 510,
                minY: -10,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.h,
                      getTitlesWidget: (value, meta) {
                        const titles = ['Affro style', 'Name', 'Name', 'Dev'];
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            titles[value.toInt()],
                            style: TextStyle(color: AppColors.grey3, fontSize: 12.sp),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.w,
                      getTitlesWidget: (value, meta) {
                        if (value % 100 == 0) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(color: AppColors.grey3, fontSize: 12.sp),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink(); // Hide other labels
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 100,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: AppColors.grey2,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 60,
                        color: AppColors.primaryColor,
                        width: 20.w,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 280,
                        color: AppColors.primaryColor,
                        width: 20.w,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 180,
                        color: AppColors.primaryColor,
                        width: 20.w,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 400,
                        color: AppColors.primaryColor,
                        width: 20.w,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

