import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import '../../../../core/widgets/default_text.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key,required this.image,required this.title});
 final String image , title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      width: double.infinity,
     // height: context.height*0.21,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: context.height*0.08,
          ),
          const SizedBox(height: 25.0),
          DefaultText(
            text: title,
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
