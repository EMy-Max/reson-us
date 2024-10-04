import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dashboard App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: const CombinedDashboardScreen(),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard', style: TextStyle(fontSize: 18.sp)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.notifications, size: 24.sp),
                onPressed: () {},
              ),
              Positioned(
                right: 8.w,
                top: 8.h,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16.w,
                    minHeight: 16.h,
                  ),
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 16.r,
            backgroundImage: const NetworkImage('https://example.com/avatar.jpg'),
          ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down, size: 24.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.language, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Appointments',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 300.h, // Adjusted height to accommodate two rows
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 400.w, // Width of two cards plus spacing
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AppointmentCard(
                                  title: 'Upcoming',
                                  count: 12,
                                  subtitle: 'Today',
                                  color: Colors.yellow[50]!,
                                  textColor: Colors.orange,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: AppointmentCard(
                                  title: 'Done',
                                  count: 8,
                                  subtitle: 'Today',
                                  color: Colors.green[50]!,
                                  textColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: AppointmentCard(
                                  title: 'Canceled',
                                  count: 8,
                                  subtitle: 'Today',
                                  color: Colors.red[50]!,
                                  textColor: Colors.red,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: AppointmentCard(
                                  title: 'No show',
                                  count: 2,
                                  subtitle: 'Today',
                                  color: Colors.grey[200]!,
                                  textColor: Colors.grey[700]!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // You can add more sets of 2x2 cards here if needed
                  ],
                ),
              ),
              //SizedBox(height: 10.h),
              Text(
                'Schedule flow',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              PeriodToggleButtons(
                selectedPeriod: selectedPeriod,
                onPeriodChanged: (period) {
                  setState(() {
                    selectedPeriod = period;
                  });
                },
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600.w,
                  height: 300.h,
                  child: ScheduleLineChart(selectedPeriod: selectedPeriod),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 24.sp),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final int count;
  final String? subtitle;
  final Color color;
  final Color textColor;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.count,
    this.subtitle,
    required this.color,
    required this.textColor,
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: Colors.grey,
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
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: ['Daily', 'Weekly', 'Annually'].map((period) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ChoiceChip(
              label: Text(period, style: TextStyle(fontSize: 14.sp)),
              selected: selectedPeriod == period,
              onSelected: (selected) {
                if (selected) {
                  onPeriodChanged(period);
                }
              },
              selectedColor: Colors.blue,
              labelStyle: TextStyle(
                color: selectedPeriod == period ? Colors.white : Colors.black,
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
        dataPoints = 365;
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
      double y = random.nextDouble() * 3 + 2; // Random value between 2 and 5
      spots.add(FlSpot(i.toDouble(), y));
    }

    return spots;
  }

  String getXAxisLabel(double value) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    switch (selectedPeriod) {
      case 'Daily':
        int dayOfYear = value.toInt();
        int month = 0;
        while (dayOfYear > DateTime(2024, month + 1, 0).day) {
          dayOfYear -= DateTime(2024, month + 1, 0).day;
          month++;
        }
        return months[month];
      case 'Weekly':
        return months[(value ~/ 4).clamp(0, 11)];
      case 'Annually':
      default:
        return months[value.toInt() % 12];
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = generateData();
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40.w,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}k',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  getXAxisLabel(value),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                );
              },
              interval: selectedPeriod == 'Daily' ? 30 : 1,
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
            color: Colors.blue.withOpacity(0.5),
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                return LineTooltipItem(
                  '${barSpot.y.toStringAsFixed(2)}k schedules',
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true,
          getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                FlLine(color: Colors.blue, strokeWidth: 2),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: Colors.white,
                      strokeWidth: 2,
                      strokeColor: Colors.blue,
                    );
                  },
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}