import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:reservon/utilities/exports.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size based on iPhone X
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dashboard App',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // ),
          home: CombinedDashboardScreen(),
        );
      },
    );
  }
}

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
      appBar: DashboardAppBar(),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 0.5,
                        offset: const Offset(0, 3),
                      )
                    ] ,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft, // Aligns the text to the left
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w, top: 0, bottom: 0, right: 0),
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
                          height: 260.h, // Adjusted height to accommodate two rows
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 400.w, // Width of two cards plus spacing
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
                              // Additional sets of 2x2 cards can be added here if needed
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 0.5,
                        offset: const Offset(0, 3),
                      )
                    ] ,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w, top: 0, bottom: 0, right: 0),
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
                            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 6.0, bottom: 3.0),
                            child: ScheduleLineChart(selectedPeriod: selectedPeriod),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const DashbNavbar(),
      floatingActionButton: FloatingActionButton(
        // autofocus: true,
        // // elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Circular shape
          side: BorderSide(
            color: grey1, // Border color
            width: 6, // Border width
          ),
        ),
        backgroundColor: primaryColor,
        child: Icon(Icons.more_vert_outlined, size: 24.sp, color: Colors.white,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


///////////////////APPOINTMENT///////////////////

class AppointmentCard extends StatelessWidget {
  final String title;
  final int count;
  final String? subtitle;
  final Color color;
  final Color textColor;
  final Color textBoxColor;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.count,
    this.subtitle,
    required this.color,
    required this.textColor,
    required this.textBoxColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h, // Set the height of the card
      child: Card(
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: textBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: const Color(0xFF667085),
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//////////SCHEDULE FLOW//////////////////

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
      //width: 170.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: Color(0xFFEEF1F3),
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: ['Daily', 'Weekly', 'Annually'].map((period) {
          final isSelected = selectedPeriod == period;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(0xFF0051C4) : Colors.transparent,
                foregroundColor: isSelected ? Colors.white : Color(0xFF667085),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              ),
              onPressed: () => onPeriodChanged(period),
              child: Text(
                period,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


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
        padding: const EdgeInsets.only(top: 0.0, left: 0, bottom: 8, right: 8),
        child: SizedBox(
          width: max(MediaQuery.of(context).size.width, data.length * 50.0),
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
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8, left: 0, bottom: 0, right: 8),
                        child: Text(
                          '${value.toInt()}k',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      );
                    },
                    interval: 1,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 0, bottom: 0, right: 8),
                        child: Text(
                          getXAxisLabel(value),
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
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
              color: const Color(0xFF0051C4), // Keep the line color as a solid color
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
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1,
                        ),
                      );
                    }).toList();
                  },
                  // You can adjust the padding for the tooltip
                  tooltipPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust the padding if needed
                  // Specify the alignment for the tooltip
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
              minY: 0,
              maxY: 5,
            ),
          ),
        ),
      ),
    );
  }
}



////////////////NAVIGATION BAR////////////////////////////
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: Icon(Icons.dashboard, size: 24.sp), onPressed: () {}),
          IconButton(icon: Icon(Icons.calendar_today, size: 24.sp), onPressed: () {}),
          SizedBox(width: 48.w),
          IconButton(icon: Icon(Icons.build, size: 24.sp), onPressed: () {}),
          IconButton(icon: Icon(Icons.web, size: 24.sp), onPressed: () {}),
        ],
      ),
    );
  }
}