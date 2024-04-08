import 'package:flutter/material.dart';

import 'package:gp2/src/common_widgets/forecast_button.dart';

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: ElevatedButton(
          // Changed RaisedButton to ElevatedButton
          child: Text('Open Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter location',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter date',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter time',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ForecastButton(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
// class BottomSheetWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Bottom Sheet Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               isScrollControlled: true, // Allow the bottom sheet to expand when the keyboard is open
//               builder: (BuildContext context) {
//                 return SingleChildScrollView(
//                   child: Container(
//                     padding: EdgeInsets.all(16),
//                     child: Column(
//                       children: [
//                         TextField(
//                           decoration: InputDecoration(labelText: 'Pickup Location'),
//                         ),
//                         SizedBox(height: 16),
//                         TextField(
//                           decoration: InputDecoration(labelText: 'Pickup Date'),
//                           onTap: () {
//                             // Show date picker
//                             // You can use showDatePicker or any other date picker widget
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextField(
//                           decoration: InputDecoration(labelText: 'Pickup Time'),
//                           onTap: () {
//                             // Show time picker
//                             // You can use showTimePicker or any other time picker widget
//                           },
//                         ),
//                         SizedBox(height: 24),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle forecast button press
//                             // Perform forecast logic here
//                           },
//                           child: Text('Forecast'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           child: Text('Show Bottom Sheet'),
//         ),
//       ),
//     );
//   }
// }
