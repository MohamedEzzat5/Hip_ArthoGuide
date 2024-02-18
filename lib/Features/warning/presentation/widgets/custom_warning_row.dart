import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
class CustomWarningRow extends StatelessWidget {
  const CustomWarningRow({
    super.key,required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: DefaultText(text: text,fontWeight: FontWeight.w500,fontSize: 16,)),
        const SizedBox(width: 15,),
        const Icon(Icons.done_outline_rounded,color: Colors.green,),
      ],
    );
  }
}