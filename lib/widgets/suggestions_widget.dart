import 'package:chef_buddy/constants/colors.dart';
import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isWeb;
  const SuggestionWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isWeb ? Colors.white : kPrimaryColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isWeb ? kPrimaryColor : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
