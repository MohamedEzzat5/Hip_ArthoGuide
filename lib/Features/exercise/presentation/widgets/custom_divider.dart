import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      color: Colors.black,
      height: 40,
    );
  }
}