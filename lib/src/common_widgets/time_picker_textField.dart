import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:intl/intl.dart';

import '../../constants.dart'; // Import the intl package for time formatting

class TimePickerTextField extends StatefulWidget {
  const TimePickerTextField({super.key});

  @override
  _TimePickerTextFieldState createState() => _TimePickerTextFieldState();
}

class _TimePickerTextFieldState extends State<TimePickerTextField> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Constants.primaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              colorScheme: ColorScheme.light(primary: Constants.primaryColor),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    // Format the selected time to display in the text field
    String formattedTime = _selectedTime != null
        ? '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
        : '';

    // Calculate the padding for the text field
    // EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    //   horizontal: MediaQuery.of(context).size.width * 0.04,
    // );

    return Column(
      children: [
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select Time',
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Constants.primaryColor),
            //contentPadding: padding,
            suffixIcon: IconButton(
              icon: const Icon(Icons.access_time, color: Constants.primaryColor),
              onPressed: () {
                _selectTime(context);
              },
            ),
          ),
          controller: TextEditingController(text: formattedTime),
          onTap: () {
            _selectTime(context);
          },
        ),
        const GradientDivider(),
      ],
    );
  }
}
