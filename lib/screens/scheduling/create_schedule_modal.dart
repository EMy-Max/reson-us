import 'package:reservon/utilities/exports.dart';

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({super.key});

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  @override
  Widget build(BuildContext context) {
    final createScheduleProvider = Provider.of<AppointmentProvider>(context);

    return ListView(children: [
      Dialog(
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
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.grey1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Schedule an appointment',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 24.w,
                        height: 24.h,
                        decoration: const BoxDecoration(
                          color: Color(0XFFEEF1F3),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          'X',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                // alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(
                  24.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                        label: 'Customer name',
                        controller:
                            createScheduleProvider.customerNameController),
                    SizedBox(height: 15.h),
                    CustomTextField(
                        label: 'Phone number',
                        controller:
                            createScheduleProvider.phoneNumberController),
                    SizedBox(height: 15.h),
                    CustomTextField(
                        label: 'Email',
                        controller: createScheduleProvider.emailController),
                    SizedBox(height: 15.h),
                    CustomDropdown(
                      dropdownList: ['Therapy session'],
                      hint: 'Select a service',
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price and duration',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Expanded(
                                child: CustomDropdown(
                                    dropdownList: ['Negotiable'],
                                    hint: 'Price type')),
                            SizedBox(height: 15.w),
                            Expanded(
                                child: CustomTextField(
                                    label: 'Amount',
                                    controller: createScheduleProvider
                                        .amountController))
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                    label: 'Hours',
                                    controller: createScheduleProvider
                                        .hoursController)),
                            SizedBox(height: 15.w),
                            Expanded(
                                child: CustomTextField(
                                    label: 'Minutes',
                                    controller: createScheduleProvider
                                        .minutesController))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date and time',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Expanded(
                                child: CustomDropdown(
                                    dropdownList: ['Negotiable'],
                                    hint: 'Price type')),
                            SizedBox(height: 15.w),
                            Expanded(
                                child: CustomTextField(
                                    label: 'Amount',
                                    controller: createScheduleProvider
                                        .amountController))
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomDropdown(
                          dropdownList: [
                        '30 min before appointment',
                        '1 Hour before appointment'
                          ],
                          hint: 'Add reminder',
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add a note to this appointment (Optional)',
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),
                      TextField(
                        controller: createScheduleProvider.noteController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ]),
                    SizedBox(height: 15.h),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add an image of what you want (Optional)',
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8.h),
                          TextField(
                            controller: createScheduleProvider.noteController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 48.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {}, // Use the passed onTap function
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Color(0XFFEEF4FE),
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ), // Use the passed button text
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        AuthNavButton(
                            buttonChild: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Create',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
