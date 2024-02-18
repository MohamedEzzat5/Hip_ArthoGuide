import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';

class CustomExerciseRow extends StatelessWidget {
  const CustomExerciseRow({
    super.key, required this.text1, required this.text2, required this.image,
  });
final String image,text1,text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: context.width * 0.35,
        ),
        const SizedBox(width: 5,),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DefaultText(text: text1,fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black,),
                const SizedBox(height: 10,),
                DefaultText(text: text2,fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,),
              ],
            ))
      ],
    );
  }
}