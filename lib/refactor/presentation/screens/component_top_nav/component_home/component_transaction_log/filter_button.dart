import 'package:flutter/material.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class TransactionFilterButton extends StatelessWidget {
  const TransactionFilterButton({super.key, required this.label, required this.count, required this.isSelected, required this.circleColor});

  final String label;
  final int count;
  final bool isSelected;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor.withValues(alpha: 0.8) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: customRegularGrey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(count.toString(),
              style: const TextStyle(
                fontSize: 18, 
                color: Colors.white, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "UbuntuBold",
              color: isSelected ? Colors.white : customHeadingText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
