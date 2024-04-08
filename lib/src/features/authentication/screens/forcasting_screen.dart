import 'package:flutter/material.dart';
import 'package:gp2/src/common_widgets/bottom_sheet_widget.dart';

class ForecastingScreen extends StatelessWidget {
  const ForecastingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(); // Return the BottomSheetWidget here
              },
            );
          },
          child: Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
