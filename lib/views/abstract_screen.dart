import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/core/widgets/default_text.dart';
import 'package:physical_therapy_app/generated/assets.dart';

class AbstractScreen extends StatelessWidget {
  const AbstractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const DefaultText(
          text: 'نبذة عن العملية',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Container(
          alignment: AlignmentDirectional.topEnd,
          padding: const EdgeInsets.all(11),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(child: Image.asset(Assets.imagesAbstract,width: context.width*0.60,)),
              const SizedBox(height: 15,),
              const DefaultText(text: AppStrings.abstractText1,fontSize: 16,fontWeight: FontWeight.w600,),
              const SizedBox(height: 5,),
              const DefaultText(text: AppStrings.abstractText2,fontSize: 16,fontWeight: FontWeight.w500,),
              const SizedBox(height: 5,),
              const DefaultText(text: AppStrings.abstractText3,fontSize: 16,fontWeight: FontWeight.w500,),
              const SizedBox(height: 15,),
              const DefaultText(text: AppStrings.abstractText4,fontSize: 16,fontWeight: FontWeight.w600,),
              const SizedBox(height: 5,),
              const DefaultText(text: AppStrings.abstractText5,fontSize: 16,fontWeight: FontWeight.w500,),
              const SizedBox(height: 15,),
              const DefaultText(text: AppStrings.abstractText6,fontSize: 16,fontWeight: FontWeight.w600,),
              const SizedBox(height: 5,),
              const DefaultText(text: AppStrings.abstractText7,fontSize: 16,fontWeight: FontWeight.w500,),

            ],
          ),
        ),
      ),
    );
  }
}
