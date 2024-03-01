import 'package:flutter/material.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_divider.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/custom_exercise_row.dart';
import 'package:physical_therapy_app/core/utils/strings.dart';
import 'package:physical_therapy_app/generated/assets.dart';

import '../../../../core/widgets/default_text.dart';

class ExerciseBody1 extends StatelessWidget {
  const ExerciseBody1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: const DefaultText(
          text: 'تمارين التمدد',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
          child: Column(
            children: [
              CustomExerciseRow(
                image: Assets.imagesExercise10,
                text1: AppStrings.exerciseText18,
                text2: AppStrings.exerciseText19,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise9,
                text1: AppStrings.exerciseText16,
                text2: AppStrings.exerciseText17,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise11,
                text1: AppStrings.exerciseText20,
                text2: AppStrings.exerciseText21,
              ),
              CustomDivider(),
              CustomExerciseRow(
                image: Assets.imagesExercise12,
                text1: AppStrings.exerciseText22,
                text2: AppStrings.exerciseText23,
              ),

            ],
          ),
        ),
      ),
    );
  }
}