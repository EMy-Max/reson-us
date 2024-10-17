import 'package:reservon/utilities/exports.dart';

//////////// CUSTOMER TIMELINE//////////////
class CustomerTimeline extends StatelessWidget {
  final List<CustomerBooking> bookings;

  const CustomerTimeline({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(booking.customerImageUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: '${booking.customerName}: ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextSpan(
                                      text: booking.phoneNumber,
                                      style: const TextStyle(
                                        color: Color(0xFF2B2B2B),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F9F4),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1C8A4C),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    booking.status,
                                    style: const TextStyle(
                                      color: Color(0xFF1C8A4C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: [
                              const TextSpan(
                                text: 'Service booked: ',
                                style: TextStyle(
                                  color: Color(0xFF0051C4),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: booking.serviceType,
                                style: const TextStyle(color: Color(0xFF667085)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: [
                              const TextSpan(
                                text: 'From-',
                                style: TextStyle(color: Color(0xFF0051C4)),
                              ),
                              TextSpan(
                                text: '${booking.startTime} / ',
                                style: const TextStyle(color: Color(0xFF2B2B2B)),
                              ),
                              const TextSpan(
                                text: 'To: ',
                                style: TextStyle(color: Color(0xFF0051C4)),
                              ),
                              TextSpan(
                                text: '${booking.endTime} = ',
                                style: const TextStyle(color: Color(0xFF2B2B2B)),
                              ),
                              TextSpan(
                                text: booking.duration,
                                style: const TextStyle(color: Color(0xFF0051C4)),
                              ),
                              const TextSpan(
                                text: ' used',
                                style: TextStyle(color: Color(0xFF2B2B2B)),
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
        );
      },
    );
  }
}

class CustomerBooking {
  final String customerName;
  final String phoneNumber;
  final String serviceType;
  final String startTime;
  final String endTime;
  final String duration;
  final String status;
  final String customerImageUrl;

  CustomerBooking({
    required this.customerName,
    required this.phoneNumber,
    required this.serviceType,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.status,
    required this.customerImageUrl,
  });
}

