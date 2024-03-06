import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: MediaQuery.of(context).size.width * 0.005,
      color: const Color(0xff076092),
      thickness: 3,
      indent: MediaQuery.of(context).size.width * 0.04,
      endIndent: MediaQuery.of(context).size.width * 0.04,
    );
  }
}
