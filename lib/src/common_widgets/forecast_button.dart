import 'package:flutter/material.dart';

class ForecastButton extends StatelessWidget {
  const ForecastButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle onTap
      },
      child: Container(
        width: 50, // Adjust the width here
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff076092),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            'Forecast',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
