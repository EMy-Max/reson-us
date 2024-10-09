import 'package:reservon/utilities/exports.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const CustomProgressIndicator({super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double stepWidth = width / (totalSteps - 1);

        return Stack(
          alignment: Alignment.centerLeft, // Center align elements
          children: [
            // Grey background line
            Container(
              height: 2,
              width: width,
              color: Colors.grey[300],
            ),
            // Progress line that changes color based on current step
            Container(
              height: 2,
              width: currentStep * stepWidth,
              color: Colors.amber, // Color for the progress line
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                totalSteps,
                    (index) => Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < currentStep ? const Color(0XFFFCF0CC) : Colors.grey[300],
                    border: Border.all(
                      color: index < currentStep ? const Color(0XFFFCF0CC) : Colors.grey[300]!,
                      width: 2, // Adjusted border width for better visibility
                    ),
                  ),
                  child: Center( // Centering the inner circle
                    child: Container(
                      width: 14, // Size of the inner circle for amber
                      height: 14, // Size of the inner circle for amber
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < currentStep ? Colors.amber : Colors.grey[600], // Darker grey for uncompleted steps
                        border: Border.all(
                          color: index < currentStep ? Colors.amber : Colors.grey[600]!,
                          width: 2, // Width of the inner circle's border
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}