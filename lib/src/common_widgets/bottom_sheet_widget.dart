import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/date_picker_text_field.dart';
import 'package:gp2/src/common_widgets/forecast_button.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:gp2/src/common_widgets/time_picker_textField.dart';

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Wrap with ListView
      shrinkWrap: true, // Set shrinkWrap to true
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Pickup Location',
            labelStyle: const TextStyle(
              color: Color(0xff076092),
              fontSize: 18,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.location_on, color: Color(0xff076092)),
              onPressed: () {},
            ),
          ),
          onTap: () {},
        ),
        const GradientDivider(),
        // const TextField(
        //   decoration: InputDecoration(
        //     hintText: 'Enter location',
        //   ),
        // ),
        const SizedBox(height: 16.0),
        DatePickerTextField(),
        const SizedBox(height: 16.0),
        TimePickerTextField(),
        const SizedBox(height: 50.0),
        SizedBox(
          width: 50, // Adjust the width here
          child: const ForecastButton(),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return CustomButton(text: 'Forecast', onTap: () {});
  //     },
  //   );
  // }
}
